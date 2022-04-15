import 'package:dmechat/core/app_state.dart';
import 'package:dmechat/screens/settings_screen.dart';
import 'package:dmechat/services/rpc_server.dart';
import 'package:dmechat/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger("InitialScreen");

class ProfileSettingsScreen extends StatelessWidget {
  static String routeName = "/profile-settings";
  ProfileSettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(routeTitle: "dmechat", actions: []),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              child: Text("Profile settings page"),
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}