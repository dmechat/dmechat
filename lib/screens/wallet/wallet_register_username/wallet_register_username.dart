import 'dart:convert';

import 'package:bip39/bip39.dart';
import 'package:convert/convert.dart';
import 'package:dmechat/core/constants.dart';
import 'package:dmechat/data.dart';
import 'package:dmechat/injection_container.dart';
import 'package:dmechatapi/api.dart';
import 'package:fast_base58/fast_base58.dart';
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
  String mnemonic = generateMnemonic();
  String username = f.internet.userName();

  saveSeedPhraseAndRegisterForGuestAccount() async {
    var sp = sl<SharedPreferences>();
    sp.setString(Keys().mnemonic, mnemonic);

    var seed = mnemonicToSeed(mnemonic);
    var api = sl<ApiApi>();
    ed25519.KeyData master =
        await ed25519.ED25519_HD_KEY.getMasterKeyFromSeed(List.from(seed));
    _log.fine("master: ${master.key} ${hex.encode(master.key)}");
    _log.fine("master base58: ${Base58Encode(master.key)}");

    var signingKey = bip32_ed25519.SigningKey.fromSeed(master.key);
    var registerResult = await registerGuestAccount(signingKey, api, sp);

    // get login token
    var loginTokenResult = loginAsGuest(signingKey, api, sp);
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
    sp.setString(Keys().accountId, result.accountId);
    sp.setString(Keys().publicKey, publicKey);
    return result;
  }

  loginAsGuest(SigningKey signingKey, ApiApi api, SharedPreferences sp) async {
    var result = await api.loginGuest(LoginAccountRequestModel(
      signature: signature,
      signedMessage: signedMessage,
      publicKey: publicKey,
    ));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                initialValue: username,
                onChanged: (value) => setState(() {
                  username = value;
                }),
                decoration: InputDecoration(
                  labelText: "Username",
                ),
              ),
              ElevatedButton(
                onPressed: saveSeedPhraseAndRegisterForGuestAccount,
                child: const Text(
                  "I wrote down my phrase. Register my username!",
                ),
              )
            ],
          ),
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