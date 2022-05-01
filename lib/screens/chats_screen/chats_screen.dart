import 'package:dmechat/core/models/models.dart';
import 'package:dmechat/data.dart';
import 'package:dmechat/screens/calls_screen/calls_screen.dart';
import 'package:dmechat/screens/contact_chat_screen/contact_chat_screen.dart';
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
  Contact person;
  void onSelectedChat(Contact c) {
    setState(() {
      person = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dmechat"),
        leading: Icon(Icons.menu),
      ),
      body: Responsive(
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: ChatsList(onTap: onSelectedChat), flex: 3),
            Flexible(
                child: ContactsChatScreen(
                  person: person,
                ),
                flex: 9),
          ],
        ),
        tablet: ChatsList(),
        mobile: ChatsList(),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
