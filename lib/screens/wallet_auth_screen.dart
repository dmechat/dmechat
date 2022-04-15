import 'package:dmechat/core/app_state.dart';
import 'package:flutter/material.dart';

class WalletAuthScreen extends StatelessWidget {
  static String routeName = "/wauth";
  AppState appState;
  WalletAuthScreen({Key key, @required this.appState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(""),
    );
  }
}
