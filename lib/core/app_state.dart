import 'dart:developer';

import 'package:dmechat/core/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  String? accountId;
  String? publicKey;
  int? balance;

  Future initialize() async {
    final prefs = await SharedPreferences.getInstance();
    accountId = prefs.getString(Constants().keys.accountId);
    publicKey = prefs.getString(Constants().keys.publicKey);
    log("Retrieved: $accountId $publicKey");
    notifyListeners();
  }

  Future authenticate(String _accountId, String _publicKey) async {
    final prefs = await SharedPreferences.getInstance();
    if (!await prefs.setString(Constants().keys.accountId, _accountId)) {
      log("not able to set accountId");
      throw Exception("Error");
    }
    if (!await prefs.setString(Constants().keys.publicKey, _publicKey)) {
      log("not able to set key");
      throw Exception("Error");
    }
    await initialize();
  }
}
