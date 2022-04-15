import 'package:dmechat/core/app_state.dart';
import 'package:dmechat/screens/connect_wallet_screen.dart';
import 'package:dmechat/screens/settings_screen.dart';
import 'package:dmechat/services/rpc_server.dart';
import 'package:dmechat/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
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

  //

  void loginwithCustomToken() async {
    var token = await Account().getAuthToken("uid");

    var authUser = await FirebaseAuth.instance.signInWithCustomToken(token);
    _log.fine("authUser $authUser");
    FirebaseDatabase.instance
        .ref("testpath")
        .set("${DateTime.now().toLocal()}  ${authUser.user?.uid}");
    // FirebaseDatabase.instance.ref("testpath2").onValue.listen(
    //       (value) => _log.fine("value: ${value.snapshot}"),
    //     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(routeTitle: "dmechat", actions: const []),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              child: const Text("Connect Wallet"),
              onPressed: loginwithCustomToken,
            )
          ],
        ),
      ),
    );
  }
}
