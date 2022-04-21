// All our routes will be available here
import 'package:dmechat/screens/contacts_screen/contacts_screen.dart';
import 'package:dmechat/screens/splash_screen/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger("Routes");

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  ContactsScreen.routeName: (context) => const ContactsScreen(),
};
