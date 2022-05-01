import 'package:dmechat/core/constants.dart';
import 'package:dmechat/injection_container.dart';
import 'package:dmechat/screens/chats_screen/chats_screen.dart';
import 'package:dmechat/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletRegisterConfirmScreen extends StatefulWidget {
  static String routeName = "/wallet-register-confirm";

  const WalletRegisterConfirmScreen({Key key}) : super(key: key);

  @override
  State<WalletRegisterConfirmScreen> createState() =>
      _WalletRegisterConfirmScreenState();
}

class _WalletRegisterConfirmScreenState
    extends State<WalletRegisterConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        desktop: const Text("desktop"),
        tablet: const WalletRegisterConfirmWidget(),
        mobile: const Text("mobile"),
      ),
    );
  }
}

class WalletRegisterConfirmWidget extends StatefulWidget {
  const WalletRegisterConfirmWidget({Key key}) : super(key: key);

  @override
  State<WalletRegisterConfirmWidget> createState() =>
      _WalletRegisterConfirmWidgetState();
}

class _WalletRegisterConfirmWidgetState
    extends State<WalletRegisterConfirmWidget> {
  bool showSeedPhrase = false;
  String seed = "";
  _WalletRegisterConfirmWidgetState() {
    seed = sl<SharedPreferences>().getString(Keys.mnemonic);
  }
  toggleSeedPhrase() {
    setState(() {
      showSeedPhrase = !showSeedPhrase;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
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
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Secure your wallet",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "It is recommended that you write down your seed phrase",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                "Don't worry, you can still find your seed phrase later",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: ElevatedButton(
                        onPressed: toggleSeedPhrase,
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Text(showSeedPhrase
                              ? "Hide Seed Phrase"
                              : "Reveal Seed Phrase"),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (showSeedPhrase)
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: SelectableText(
              seed,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ElevatedButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(ChatsScreen.routeName),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Text("Start"),
          ),
        )
      ],
    );
  }
}
