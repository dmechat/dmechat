import 'package:dmechat/core/constants.dart';
import 'package:dmechat/injection_container.dart';
import 'package:dmechat/screens/chats_screen/chats_screen.dart';
import 'package:dmechat/screens/wallet_setup_screen/wallet_setup_screen.dart';
import 'package:dmechat/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sp = sl<SharedPreferences>();
    var accountId = sp.getString(Keys().accountId);
    var contents = Column(children: [
      ElevatedButton(
        child: const Text(
          "Go to contacts screen",
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(ChatsScreen.routeName);
        },
      ),
      ElevatedButton(
        child: const Text(
          "Go to wallet setup screen",
        ),
        onPressed: accountId != null
            ? null
            : () {
                Navigator.of(context)
                    .pushReplacementNamed(WalletSetupScreen.routeName);
              },
      ),
      Text(accountId)
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
