import 'dart:ui';

import 'package:dmechat/core/constants.dart';
import 'package:flutter/material.dart';

class WalletRegisterUsername extends StatefulWidget {
  static String routeName = "/wallet-register";
  const WalletRegisterUsername({Key key}) : super(key: key);

  @override
  State<WalletRegisterUsername> createState() => _WalletRegisterUsernameState();
}

class _WalletRegisterUsernameState extends State<WalletRegisterUsername> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: kDefaultPadding / 3,
            sigmaY: kDefaultPadding / 3,
          ),
          child: TextFormField(
              initialValue:
                  "aejfejfa eafueaufifae feaiofeaioj faeiefaifea feiaaief feaiiefi iefi fieajfioeajfj feaofijeaofefa",
              minLines: 4,
              maxLines: 5),
        ),
      ),
    );
  }
}
