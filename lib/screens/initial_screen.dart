import 'package:dmechat/core/app_state.dart';
import 'package:dmechat/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:quick_log/quick_log.dart';
import "package:dmechat/injection_container.dart";

const _log = Logger("InitialScreen");

class InitialScreen extends StatelessWidget {
  static String routeName = "/";
  AppState appState;
  Map<String, String> queryParameters;
  InitialScreen({
    Key key,
    @required this.appState,
    @required this.queryParameters,
  }) : super(key: key) {
    appState = sl<AppState>();
  }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(routeTitle: "dmechat", actions: const []),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            OutlinedButton(
              child: Text("Connect Wallet"),
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}
