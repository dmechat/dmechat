import 'package:dmechat/core/theme.dart';
import 'package:dmechat/screens/chat_home_screen.dart';
import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String routeTitle;
  List<Widget> actions = [];
  AppTopBar({Key key, @required this.routeTitle, @required this.actions})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: false,
      elevation: 0,
      title: TextButton(
        child: Text(
          routeTitle,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: () =>
            Navigator.pushReplacementNamed(context, ChatHomeScreen.routeName),
      ),
      leading: Container(),
      leadingWidth: 0,
      actions: actions,
    );
  }
}
