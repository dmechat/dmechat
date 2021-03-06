// All our routes will be available here
import 'package:dmechat/screens/calls_screen/calls_screen.dart';
import 'package:dmechat/screens/chats_screen/chats_screen.dart';
import 'package:dmechat/screens/contact_chat_screen/contact_chat_screen.dart';
import 'package:dmechat/screens/contacts_screen/contacts_screen.dart';
import 'package:dmechat/screens/splash_screen/splash_screen.dart';
import 'package:dmechat/screens/wallet/wallet_register_confirm/wallet_register_confirm.dart';
import 'package:dmechat/screens/wallet/wallet_register_username/wallet_register_username.dart';
import 'package:dmechat/screens/wallet_setup_screen/wallet_setup_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger("Routes");

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  ContactsScreen.routeName: (context) => const ContactsScreen(),
  WalletSetupScreen.routeName: (context) => const WalletSetupScreen(),
  WalletRegisterUsername.routeName: (context) => const WalletRegisterUsername(),
  WalletRegisterConfirmScreen.routeName: (context) =>
      const WalletRegisterConfirmScreen(),
  ChatsScreen.routeName: (context) => const ChatsScreen(),
  ContactsChatScreen.routeName: (context) => ContactsChatScreen(),
  CallsScreen.routeName: (context) => const CallsScreen(),
};
