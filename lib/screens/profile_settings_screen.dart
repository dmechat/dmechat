import 'package:dmechat/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger("InitialScreen");

class ProfileSettingsScreen extends StatelessWidget {
  static String routeName = "/profile-settings";
  ProfileSettingsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(routeTitle: "dmechat", actions: []),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
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
