import 'package:dmechat/core/app_state.dart';
import 'package:dmechat/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import "package:universal_html/html.dart" as html;
import 'package:quick_log/quick_log.dart';
import 'package:url_launcher/url_launcher.dart';

const _log = Logger("InitialScreen");

class InitialScreen extends StatelessWidget {
  static String routeName = "/";
  AppState appState;
  Map<String, String> queryParameters;
  InitialScreen({
    Key? key,
    required this.appState,
    required this.queryParameters,
  }) : super(key: key);

  void _onFloatingActionPressed(BuildContext context) async {
    const href = "https://www.dmechat.com";
    var walletLoginUrl =
        "https://wallet.testnet.near.org/login/?success_url=$href&failure_url=$href";
    // html.window.location.assign(walletLoginUrl);

    // _log.info("html, ${html.window.location.href}");
    if (await canLaunch(walletLoginUrl)) {
      await launch(walletLoginUrl,
          forceWebView: true, webOnlyWindowName: "dmechat");
    }
  }

  void authenticate(BuildContext context) async {
    // TODO: This needs to be fixed for other platforms
    // Figure out what to do with the incoming querystring parameters here
    String? accountId = queryParameters["account_id"];
    String? key = queryParameters["all_keys"];
    _log.info("accountId: $accountId key: $key");
    if (accountId != null &&
        accountId.isNotEmpty &&
        key != null &&
        key.isNotEmpty) {
      await appState.authenticate(accountId, key);
      Navigator.pushNamed(context, SettingsScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    authenticate(context);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("widget.title"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<AppState>(
                builder: (context, state, child) => Text(
                      'You are ${state.accountId}:',
                    )),
            Text(
              '_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onFloatingActionPressed(context);
        },
        tooltip: 'LogIn',
        child: const Icon(Icons.login),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
