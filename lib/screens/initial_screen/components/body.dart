import 'package:dmechat/core/constants.dart';
import 'package:dmechat/injection_container.dart';
import 'package:dmechatapi/api.dart';
import 'package:flutter/material.dart';
import 'package:bip39/bip39.dart' as bip39;
// import 'package:cryptography/cryptography.dart' as cr;
import 'package:quick_log/quick_log.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hex/hex.dart';

var _log = const Logger("InitialScreen:Body");

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String requestedUsername;

  registerAccount() async {
    var api = sl<ApiApi>();
    var sp = sl<SharedPreferences>();
    if (sp.containsKey(Keys().seed)) {
      throw Exception("A seed already exists on this machine");
    }
    // var mnemonic = bip39.generateMnemonic();
    // _log.fine("mnemonic $mnemonic");
    // // var sh = bip39.mnemonicToSeedHex(mnemonic);
    // // _log.fine("sh $sh");

    // var keys = await cr.Ed25519().newKeyPairFromSeed(HEX.decode(mnemonic));

    // _log.fine("keys $keys");

    // api.registerGuestAccount(RegisterGuestAccountRequestModel(
    //     signature: signature,
    //     signedMessage: signedMessage,
    //     publicKey: publicKey));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55.0, vertical: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("You are not logged in. "),
          TextField(
            decoration: const InputDecoration(hintText: "Select your username"),
            onChanged: (String name) {
              setState(() => requestedUsername = name);
            },
          ),
          OutlinedButton(
            child: const Text("Create Account"),
            onPressed: registerAccount,
          )
        ],
      ),
    );
  }
}
