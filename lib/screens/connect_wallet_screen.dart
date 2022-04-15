import 'package:dmechat/screens/chat_home_screen.dart';
import 'package:dmechat/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger("InitialScreen");

class ConnectWalletScreen extends StatelessWidget {
  static String routeName = "/connect-wallet";
  const ConnectWalletScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(routeTitle: "dmechat", actions: []),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your passphrase',
                ),
              ),
            ),
            OutlinedButton(
              child: const Text("Connect"),
              onPressed: () =>
                  Navigator.pushNamed(context, ChatHomeScreen.routeName),
            )
          ],
        ),
      ),
    );
  }
}
