import 'package:dmechat/core/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger('AppState');

class AppState extends ChangeNotifier {
  String accountId;
  String publicKey;
  int balance;
  FirebaseApp firebase;
  Future initialize() async {
    // TODO: Move all of this to env.json
    firebase = await Firebase.initializeApp(
      name: "dmechat",
      options: const FirebaseOptions(
        apiKey: "AIzaSyBwxYR8mCIlBcv38AUjY-WJOP0PR8davdA",
        appId: "1:663814795413:web:fc21819c28f1fcdb24eb9c",
        messagingSenderId: "663814795413",
        projectId: "dmechat-testnet",
        authDomain: "dmechat-testnet.firebaseapp.com",
        databaseURL: "https://dmechat-testnet-default-rtdb.firebaseio.com",
        storageBucket: "dmechat-testnet.appspot.com",
      ),
    );
    // final prefs = await SharedPreferences.getInstance();

    // _log.info("initialize.prefs $prefs ${prefs.getKeys()}");
    // accountId = prefs.getString(Keys().accountId);
    // publicKey = prefs.getString(Keys().publicKey);
    // _log.fine("Retrieved: $accountId $publicKey");
    // // notifyListeners();
  }

  // Future authenticate(String _accountId, String _publicKey) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   _log.info("authenticate.prefs $prefs");
  //   if (!await prefs.setString(Keys().accountId, _accountId)) {
  //     _log.fine("not able to set accountId");
  //     throw Exception("Error");
  //   }
  //   if (!await prefs.setString(Keys().publicKey, _publicKey)) {
  //     _log.fine("not able to set key");
  //     throw Exception("Error");
  //   }
  //   await prefs.reload();
  //   _log.info("initialize.prefs $prefs ${prefs.getKeys()}");
  //   await initialize();
  // }
}
