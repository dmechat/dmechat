import 'package:dmechat/screens/calls_screen/calls_screen.dart';
import 'package:dmechat/screens/chats_screen/chats_screen.dart';
import 'package:dmechat/screens/contacts_screen/contacts_screen.dart';
import 'package:dmechat/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  int currentIndex;
  BottomNavBar({Key key, @required this.currentIndex}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  _BottomNavBarState();

  Map<int, String> routes = {
    0: ChatsScreen.routeName,
    1: ContactsScreen.routeName,
    2: CallsScreen.routeName,
    3: CallsScreen.routeName,
  };

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      onTap: (index) {
        if (index != widget.currentIndex) {
          Navigator.of(context).pushNamed(routes[index]);
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_page),
          label: "Contacts",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone_in_talk),
          label: "Calls",
        ),
      ],
    );
    return Responsive(
      desktop: SizedBox(width: 0, height: 0),
      tablet: bottomNavigationBar,
      mobile: bottomNavigationBar,
    );
  }
}
