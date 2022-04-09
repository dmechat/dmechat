import 'package:dmechat/core/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger('AppState');

class AppState extends ChangeNotifier {
  String? accountId;
  String? publicKey;
  int? balance;

  Future initialize() async {
    final prefs = await SharedPreferences.getInstance();

    _log.info("initialize.prefs $prefs ${prefs.getKeys()}");
    accountId = prefs.getString(Constants().keys.accountId);
    publicKey = prefs.getString(Constants().keys.publicKey);
    _log.fine("Retrieved: $accountId $publicKey");
    // notifyListeners();
  }

  Future authenticate(String _accountId, String _publicKey) async {
    final prefs = await SharedPreferences.getInstance();
    _log.info("authenticate.prefs $prefs");
    if (!await prefs.setString(Constants().keys.accountId, _accountId)) {
      _log.fine("not able to set accountId");
      throw Exception("Error");
    }
    if (!await prefs.setString(Constants().keys.publicKey, _publicKey)) {
      _log.fine("not able to set key");
      throw Exception("Error");
    }
    await prefs.reload();
    _log.info("initialize.prefs $prefs ${prefs.getKeys()}");
    await initialize();
  }
}
