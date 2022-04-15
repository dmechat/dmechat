// All our routes will be available here
import 'package:dmechat/core/app_state.dart';
import 'package:dmechat/screens/chat_home_screen.dart';
import 'package:dmechat/screens/connect_wallet_screen.dart';
import 'package:dmechat/screens/initial_screen.dart';
import 'package:dmechat/screens/profile_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:dmechat/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger("Routes");

final List<String> routes = [
  SettingsScreen.routeName,
  InitialScreen.routeName,
  ConnectWalletScreen.routeName,
  ProfileSettingsScreen.routeName,
  ChatHomeScreen.routeName
];

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  _log.fine("route settings $settings $routes");
  if (routes.contains(settings.name)) {
    return getRoute(settings.name, <String, String>{}, settings);
  } else {
    Uri uri = Uri.tryParse(settings.name as dynamic);
    if (uri != null && routes.contains(uri.path)) {
      return getRoute(uri.path, uri.queryParameters, settings);
    }
    throw Exception("Not found");
  }
}

Route<dynamic> getRoute(
    String name, Map<String, String> queryParameters, RouteSettings settings) {
  if (name == SettingsScreen.routeName) {
    return MaterialPageRoute(
      builder: (context) {
        return const SettingsScreen();
      },
      settings: settings,
    );
  }

  if (name == ConnectWalletScreen.routeName) {
    return MaterialPageRoute(
      builder: (context) {
        return ConnectWalletScreen();
      },
      settings: settings,
    );
  }

  if (name == ProfileSettingsScreen.routeName) {
    return MaterialPageRoute(
      builder: (context) {
        return ProfileSettingsScreen();
      },
      settings: settings,
    );
  }

  if (name == ChatHomeScreen.routeName) {
    return MaterialPageRoute(
      builder: (context) {
        return ChatHomeScreen();
      },
      settings: settings,
    );
  }

  if (name == InitialScreen.routeName) {
    return MaterialPageRoute(
      builder: (context) {
        return Consumer<AppState>(
          builder: (_context, appState, child) {
            return InitialScreen(
              appState: appState,
              queryParameters: queryParameters,
            );
          },
        );
      },
      settings: settings,
    );
  }
  throw Exception("Not found");
}
