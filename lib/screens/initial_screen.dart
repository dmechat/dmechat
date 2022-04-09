import 'package:dmechat/core/app_state.dart';
import 'package:dmechat/screens/settings_screen.dart';
import 'package:dmechat/services/rpc_server.dart';
import 'package:dmechat/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger("InitialScreen");

class InitialScreen extends StatelessWidget {
  static String routeName = "/";
  AppState appState;
  Map<String, String> queryParameters;
  Balance balance =
      Balance(total: "", available: "", staked: "", stateStaked: "");
  InitialScreen({
    Key? key,
    required this.appState,
    required this.queryParameters,
  }) : super(key: key);

  void _onFloatingActionPressed(BuildContext context) async {
    // const href = "https://www.dmechat.com";
    // var walletLoginUrl =
    //     "https://wallet.testnet.near.org/login/?success_url=$href&failure_url=$href";
    // // html.window.location.assign(walletLoginUrl);

    // // _log.info("html, ${html.window.location.href}");
    // if (await canLaunch(walletLoginUrl)) {
    //   await launch(walletLoginUrl,
    //       forceWebView: true, webOnlyWindowName: "dmechat");
    // }
  }

  Future authenticate(BuildContext context) async {
    // TODO: This needs to be fixed for other platforms
    // Figure out what to do with the incoming querystring parameters here
    String? accountId = queryParameters["account_id"];
    String? key = queryParameters["all_keys"];
    _log.info("accountId: $accountId key: $key");
    // if (accountId != null &&
    //     accountId.isNotEmpty &&
    //     key != null &&
    //     key.isNotEmpty) {
    //   await appState.authenticate(accountId, key);
    //   Navigator.pushNamed(context, SettingsScreen.routeName);
    // }
    // balance = await Account().getBalance("gtacodingtutor.testnet");
  }

  @override
  Widget build(BuildContext context) {
    authenticate(context);
    return Scaffold(
      appBar: AppTopBar(routeTitle: "dmechat", actions: []),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
