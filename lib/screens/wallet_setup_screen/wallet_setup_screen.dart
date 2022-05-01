import 'package:dmechat/core/constants.dart';
import 'package:dmechat/screens/wallet/wallet_register_username/wallet_register_username.dart';
import 'package:dmechat/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class WalletSetupScreen extends StatefulWidget {
  static String routeName = "/wallet-setup";

  const WalletSetupScreen({Key key}) : super(key: key);

  @override
  State<WalletSetupScreen> createState() => _WalletSetupScreenState();
}

class _WalletSetupScreenState extends State<WalletSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: WalletSetupScreenContents(),
        tablet: WalletSetupScreenContents(),
        desktop: Text("desktop"),
      ),
    );
  }
}

class WalletSetupScreenContents extends StatelessWidget {
  const WalletSetupScreenContents({
    Key key,
  }) : super(key: key);

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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: ElevatedButton(
            child: Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Text(
                "Import using seed phrase",
              ),
            ),
            onPressed: null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Text(
                "Create a new wallet",
              ),
            ),
            onPressed: () => Navigator.of(context)
                .pushNamed(WalletRegisterUsername.routeName),
          ),
        ),
      ],
    );
  }
}
