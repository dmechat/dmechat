// All our routes will be available here
import 'package:dmechat/screens/calls_screen/calls_screen.dart';
import 'package:dmechat/screens/chats_screen/chats_screen.dart';
import 'package:dmechat/screens/contacts_screen/contacts_screen.dart';
import 'package:dmechat/screens/splash_screen/splash_screen.dart';
import 'package:dmechat/screens/wallet/wallet_register_username/wallet_register_username.dart';
import 'package:dmechat/screens/wallet_setup_screen/wallet_setup_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger("Routes");

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  ContactsScreen.routeName: (context) => const ContactsScreen(),
  ChatsScreen.routeName: (context) => const ChatsScreen(),
  CallsScreen.routeName: (context) => const CallsScreen(),
  WalletSetupScreen.routeName: (context) => const WalletSetupScreen(),
  WalletRegisterUsername.routeName: (context) => const WalletRegisterUsername(),
};
