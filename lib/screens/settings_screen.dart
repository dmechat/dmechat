import 'package:dmechat/core/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger("SettingsScreen");

class SettingsScreen extends StatelessWidget {
  static String routeName = "/settings";

  const SettingsScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _log.info("built settingsscreen");
    return Scaffold(
      body: Consumer<AppState>(
        builder: (context, state, child) => Text(
          'SettingsScreen: You are ${state.accountId}:',
        ),
      ),
    );
  }
}
