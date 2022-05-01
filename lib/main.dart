import 'package:dmechat/core/app_state.dart';
import 'package:dmechat/injection_container.dart' as sl;
import 'package:dmechat/routes.dart';
import 'package:dmechat/screens/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await sl.init();
  AppState appState = sl.sl<AppState>();
  appState.initialize();
  runApp(
    const DMEChat(),
  );
}

class DMEChat extends StatelessWidget {
  const DMEChat({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dmechat',
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
