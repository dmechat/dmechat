import 'package:dmechat/screens/chats_screen/chats_screen.dart';
import 'package:dmechat/screens/contacts_screen/contacts_screen.dart';
import 'package:dmechat/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var elevatedButton = ElevatedButton(
      child: Text("Go to contacts screen"),
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(ChatsScreen.routeName);
      },
    );
    return Scaffold(
      body: Responsive(
        desktop: elevatedButton,
        tablet: elevatedButton,
        mobile: elevatedButton,
      ),
    );
  }
}
