import 'package:dmechat/screens/wallet/wallet_register_username/wallet_register_username.dart';
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
    return Scaffold(
      body: Column(
        children: [
          Text("Wallet Setup"),
          ElevatedButton(
              onPressed: () {},
              child: Text("Import using Seed Phrase (doesn't work)")),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(WalletRegisterUsername.routeName);
            },
            child: Text("Register a username"),
          ),
        ],
      ),
    );
  }
}
