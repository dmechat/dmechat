import 'dart:convert';

import 'package:bip39/bip39.dart';
import 'package:convert/convert.dart';
import 'package:dmechat/core/app_state.dart';
import 'package:dmechat/core/constants.dart';
import 'package:dmechat/core/models/dme_auth_user.dart';
import 'package:dmechat/data.dart';
import 'package:dmechat/injection_container.dart';
import 'package:dmechat/screens/chats_screen/chats_screen.dart';
import 'package:dmechat/screens/wallet/wallet_register_confirm/wallet_register_confirm.dart';
import 'package:dmechat/widgets/responsive/responsive.dart';
import 'package:dmechatapi/api.dart';
import 'package:fast_base58/fast_base58.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pinenacl/ed25519.dart';
import 'package:quick_log/quick_log.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart' as ed25519;
import 'package:bip32_ed25519/bip32_ed25519.dart' as bip32_ed25519;

const _log = Logger("WalletRegisterUsernameScreen");

class WalletRegisterUsername extends StatefulWidget {
  static String routeName = "/wallet-register";
  const WalletRegisterUsername({Key key}) : super(key: key);

  @override
  State<WalletRegisterUsername> createState() => _WalletRegisterUsernameState();
}

class _WalletRegisterUsernameState extends State<WalletRegisterUsername> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
          desktop: Text("Desktop"),
          tablet: WalletRegisterWidget(),
          mobile: WalletRegisterWidget()),
    );
  }
}

class WalletRegisterWidget extends StatefulWidget {
  const WalletRegisterWidget({Key key}) : super(key: key);

  @override
  State<WalletRegisterWidget> createState() => _WalletRegisterWidgetState();
}

class _WalletRegisterWidgetState extends State<WalletRegisterWidget> {
  String mnemonic = generateMnemonic();
  String username = f.person.firstName().toLowerCase();

  saveSeedPhraseAndRegisterForGuestAccount() async {
    var sp = sl<SharedPreferences>();
    sp.setString(Keys.mnemonic, mnemonic);

    var seed = mnemonicToSeed(mnemonic);
    var api = sl<ApiApi>();
    ed25519.KeyData master =
        await ed25519.ED25519_HD_KEY.getMasterKeyFromSeed(List.from(seed));
    _log.fine("master: ${master.key} ${hex.encode(master.key)}");
    _log.fine("master base58: ${Base58Encode(master.key)}");

    var signingKey = bip32_ed25519.SigningKey.fromSeed(master.key);
    var registerResult = await registerGuestAccount(signingKey, api, sp);
    _log.fine("registerResult: $registerResult");

    // get login token
    var loginTokenResult = await loginAsGuest(signingKey, api, sp);
    var appState = sl<AppState>();
    var signInResult = await FirebaseAuth.instanceFor(app: appState.firebase)
        .signInWithCustomToken(loginTokenResult.signInToken);
    _log.fine("signInResult: $signInResult");
    sp.setString(
      Keys.credentials,
      jsonEncode(
        DMEAuthUser.toJson(DMEAuthUser.fromUser(
          signInResult.user,
          await signInResult.user.getIdToken(),
        )),
      ),
    );
    _log.fine(
        "We have created the wallet and account. This page should be locked");

    var pk = Base58Encode(signingKey.publicKey.buffer.asUint8List());
    var publicKey = "ed25519:$pk";
    var root = FirebaseDatabase.instanceFor(app: appState.firebase);
    await root
        .ref("users")
        .child(publicKey)
        .update({"accountId": signInResult.user.uid});

    // await root
    //     .ref("users")
    //     .child("ed25519:Gm3oH3r6RsRprvgvaQCR5yaBBBeVmddNghLY8EZb2WMi")
    //     .child("invitations")
    //     .update({publicKey: signInResult.user.uid});

    Navigator.of(context)
        .pushReplacementNamed(WalletRegisterConfirmScreen.routeName);
  }

  Future<RegisterGuestAccountResponseModel> registerGuestAccount(
      SigningKey signingKey, ApiApi api, SharedPreferences sp) async {
    var pk = Base58Encode(signingKey.publicKey.buffer.asUint8List());
    var publicKey = "ed25519:$pk";
    var accountId = "$username.guests.dev-1650038403427-88855978238907";
    var message = jsonEncode({"accountId": accountId});
    var signedMessage = signingKey.sign(Uint8List.fromList(message.codeUnits));

    var model = RegisterGuestAccountRequestModel(
      publicKey: publicKey,
      signedMessage: base64.encode(signedMessage.asTypedList),
      signature: base64.encode(signedMessage.signature.asTypedList),
    );
    _log.fine("Calling API with $model");

    // registerGuestAccount
    var result = await api.registerGuestAccount(model);
    _log.fine("result: $result");
    sp.setString(Keys.accountId, result.accountId);
    sp.setString(Keys.publicKey, publicKey);
    return result;
  }

  Future<LoginAccountResponseModel> loginAsGuest(
      SigningKey signingKey, ApiApi api, SharedPreferences sp) async {
    var pk = Base58Encode(signingKey.publicKey.buffer.asUint8List());
    var publicKey = "ed25519:$pk";
    var accountId = "$username.guests.dev-1650038403427-88855978238907";
    var message = jsonEncode({"accountId": accountId});
    var signedMessage = signingKey.sign(Uint8List.fromList(message.codeUnits));
    var result = await api.loginGuest(LoginAccountRequestModel(
      publicKey: publicKey,
      signedMessage: base64.encode(signedMessage.asTypedList),
      signature: base64.encode(signedMessage.signature.asTypedList),
    ));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: TextFormField(
                initialValue: username,
                onChanged: (value) => setState(() {
                  username = value;
                }),
                decoration: const InputDecoration(
                  labelText: "Username",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: saveSeedPhraseAndRegisterForGuestAccount,
              child: const Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Text(
                  "Register my username!",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ImageFiltered(
//                 imageFilter: ImageFilter.blur(
//                   sigmaX: blur ? kDefaultPadding / 2 : 0.1,
//                   sigmaY: blur ? kDefaultPadding / 2 : 0.1,
//                 ),
//                 child: SelectableText(
//                   seed,
//                   enableInteractiveSelection: !blur,
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//               ),