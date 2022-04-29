import 'package:dmechat/screens/chats_screen/chats_screen.dart';
import 'package:dmechat/screens/contacts_screen/contacts_screen.dart';
import 'package:dmechat/screens/wallet_setup_screen/wallet_setup_screen.dart';
import 'package:dmechat/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contents = Column(children: [
      ElevatedButton(
        child: Text(
          "Go to contacts screen",
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(ChatsScreen.routeName);
        },
      ),
      ElevatedButton(
        child: Text(
          "Go to wallet setup screen",
        ),
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed(WalletSetupScreen.routeName);
        },
      ),
    ]);
    return Scaffold(
      body: Responsive(
        desktop: contents,
        tablet: contents,
        mobile: contents,
      ),
    );
  }
}
