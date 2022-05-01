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
    return const Scaffold(
      body: Responsive(
        desktop: SplashPageContents(),
        tablet: SplashPageContents(),
        mobile: SplashPageContents(),
      ),
    );
  }
}

class SplashPageContents extends StatelessWidget {
  const SplashPageContents({
    Key key,
  }) : super(key: key);

  navigateToApp(BuildContext context) {
    // get sharedpreferences
    var sp = sl<SharedPreferences>();

    // if accountId exists, a wallet is created and registered
    // go to chats screen
    if (sp.containsKey(Keys.accountId) && sp.containsKey(Keys.mnemonic)) {
      Navigator.of(context).pushNamed(ChatsScreen.routeName);
    }

    // else
    // go to wallet create page
    else {
      Navigator.of(context).pushNamed(WalletSetupScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/dme-logo.png",
                scale: 0.5,
              ),
            ],
          ),
          ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Text(
                "Get Started",
              ),
            ),
            onPressed: () => navigateToApp(context),
          ),
        ]);
  }
}
