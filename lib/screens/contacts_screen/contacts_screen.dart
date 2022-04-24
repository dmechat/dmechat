import 'package:dmechat/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:dmechat/widgets/chats/chats_list.dart';
import 'package:dmechat/widgets/contacts/contacts_list.dart';
import 'package:dmechat/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  static String routeName = "/contacts";
  const ContactsScreen({Key key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Responsive(
        desktop: Text("desktop"),
        tablet: ContactsList(),
        mobile: ContactsList(),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}
