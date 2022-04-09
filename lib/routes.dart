// All our routes will be available here
import 'package:dmechat/core/app_state.dart';
import 'package:flutter/widgets.dart';
import 'package:dmechat/screens/home_screen.dart';
import 'package:dmechat/screens/settings_screen.dart';
import 'package:provider/provider.dart';

final Map<String, WidgetBuilder> routes = {
  SettingsScreen.routeName: (context) => const SettingsScreen(),
  InitialScreen.routeName: (context) => Consumer<AppState>(
        builder: (_context, appState, child) {
          return InitialScreen(appState: appState);
        },
      ),
};
