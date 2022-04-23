import 'package:dmechat/screens/calls_screen/calls_screen.dart';
import 'package:dmechat/screens/contacts_screen/contacts_screen.dart';
import 'package:dmechat/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:dmechat/widgets/chats/chats_list.dart';
import 'package:dmechat/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  static String routeName = "/chats";
  const ChatsScreen({Key key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Responsive(
        tablet: Text("tablet"),
        desktop: Text("desktop"),
        mobile: ChatsList(),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
