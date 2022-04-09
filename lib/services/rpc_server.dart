import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_log/quick_log.dart';

const BasePath = "https://dme-rpc-server.vercel.app/api";

const _log = Logger("RPCServer");

class Balance {
  String total;
  String stateStaked;
  String staked;
  String available;
  Balance({
    required this.total,
    required this.available,
    required this.staked,
    required this.stateStaked,
  });
}

class Account {
  Future<Balance> getBalance(String accountId) async {
    var url = Uri.parse("$BasePath/account/balance?accountId=$accountId");
    var response = await http.get(url);
    _log.debug("response is ${response.body}");
    var map = jsonDecode(response.body);
    return Balance(
      available: map["available"]!,
      staked: map["staked"]!,
      total: map["total"]!,
      stateStaked: map["stateStaked"]!,
    );
  }
}
