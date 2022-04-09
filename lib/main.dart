import 'dart:developer';

import 'package:dmechat/core/app_state.dart';
import 'package:dmechat/routes.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      theme: ThemeData(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
