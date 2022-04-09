import 'dart:developer';

import 'package:dmechat/core/app_state.dart';
import 'package:dmechat/routes.dart';
import 'package:dmechat/screens/home_screen.dart';
import 'package:dmechat/screens/wallet_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';

void main() {
  setPathUrlStrategy();
  AppState appState = AppState();
  appState.initialize();
  runApp(
    ChangeNotifierProvider(
        create: (context) => appState, child: const DMEChat()),
  );
}

class DMEChat extends StatelessWidget {
  const DMEChat({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dmechat',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: InitialScreen.routeName,
      routes: routes,
      // onUnknownRoute: (settings) {
      //   print("onUnknownRoute.settings: $settings");
      // },
      onGenerateRoute: (settings) {
        print("settings: $settings");
        if (settings.name == "/wauth") {
          Navigator.pushReplacementNamed(context, WalletAuthScreen.routeName,
              arguments: settings.arguments);
        }
        return null;
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   String accountId = "";
//   String? keys;

//   void _incrementCounter() {
//     // setState(() {
//     //   // This call to setState tells the Flutter framework that something has
//     //   // changed in this State, which causes it to rerun the build method below
//     //   // so that the display can reflect the updated values. If we changed
//     //   // _counter without calling setState(), then the build method would not be
//     //   // called again, and so nothing would appear to happen.
//     //   _counter++;
//     // });
//     var walletLoginUrl =
//         "https://wallet.testnet.near.org/login/?success_url=${html.window.location.href}&failure_url=${html.window.location.href}";
//     html.window.location.assign(walletLoginUrl);
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("html.window.location, ${html.window.location}");
//     var uri = Uri.tryParse(html.window.location.href);
//     setState(() {
//       accountId = uri?.queryParameters["account_id"] ?? accountId;
//       keys = uri?.queryParameters["keys"] ?? keys;
//       print("2 accountId: $accountId");
//     });
//     print("1 accountId, $accountId");
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You are $accountId:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'LogIn',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
