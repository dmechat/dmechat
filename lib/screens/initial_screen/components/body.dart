import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:dmechat/core/constants.dart';
import 'package:dmechat/injection_container.dart';
import 'package:dmechatapi/api.dart';
import 'package:fast_base58/fast_base58.dart' as base58;
import 'package:flutter/material.dart';
import 'package:pinenacl/ed25519.dart';
import 'package:quick_log/quick_log.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart' as ed25519;

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
    // var seed = bip39.mnemonicToSeed(bip39.generateMnemonic());
    var seed = bip39.mnemonicToSeed(
        "lottery garbage effort buffalo crop achieve limit absent stay pause shell drama");

    // print(
    //     'entr: ${bip39.mnemonicToEntropy("lottery garbage effort buffalo crop achieve limit absent stay pause shell drama")}');
    // ed25519.KeyData
    // hex.decode
    // var _hex = hex.encode(List.from(seed));
    // _log.fine(_hex);

    ed25519.KeyData master =
        await ed25519.ED25519_HD_KEY.getMasterKeyFromSeed(List.from(seed));
    _log.fine("master: ${master.key} ${hex.encode(master.key)}");
    _log.fine("master base58: ${base58.Base58Encode(master.key)}");

    var signingKey = SigningKey.fromSeed(master.key);

    _log.fine(
        "signingKey: ${base58.Base58Encode(signingKey.buffer.asUint8List())} ");

    // var sk = PrivateKey(seed);
    // _log.fine("sk: ${base58.Base58Encode(sk.keyBytes)}");

    // var pathMaster =
    //     await ed25519.ED25519_HD_KEY.derivePath("m/1'/1'/1'", List.from(seed));
    // var pb = await ed25519.ED25519_HD_KEY.getPublicKey(pathMaster.key);
    // var encodedStr = base58.Base58Encode(pb);
    // _log.fine("publicKey: $pb  $encodedStr");

    // pb = await ed25519.ED25519_HD_KEY.getPublicKey(master.key);
    // encodedStr = base58.Base58Encode(pb);
    // _log.fine("publicKey: $pb  $encodedStr");

    // var data = jsonEncode({"accountId": "person.guests.dmechat.testnet"});
    // _log.fine(utf8.decode(hdWallet.sign(data)));

    // var mnemonic = bip39.generateMnemonic();
    // _log.fine("mnemonic $mnemonic");
    // var seed = bip39.mnemonicToSeed(mnemonic);
    // var entropy = bip39.entropyToMnemonic(utf8.encode("entropyString"));
    // _log.fine("entropy $entropy");
    // _log.fine(seed.length);
    // _log.fine(seed.lengthInBytes);
    // // var keys = bip32.BIP32.fromSeed(seed);
    // _log.fine(
    //   "keys: ${keys.toBase58()} ${keys.privateKey} ${keys.publicKey}",
    // );

    // ed25519.PrivateKey.fromSeed(seed);

    // var keys = ed25519.PrivateKey.generate();
    // _log.fine(keys.publicKey);

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
