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
      body: Responsive(
        tablet: Text("tablet"),
        desktop: Text("desktop"),
        mobile: ContactsList(),
      ),
    );
  }
}
