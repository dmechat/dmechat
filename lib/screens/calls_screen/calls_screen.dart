import 'package:dmechat/core/constants.dart';
import 'package:dmechat/core/models/models.dart';
import 'package:dmechat/data.dart';
import 'package:dmechat/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:dmechat/widgets/chats/chats_list.dart';
import 'package:dmechat/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class CallsScreen extends StatefulWidget {
  static String routeName = "/calls";
  const CallsScreen({Key key}) : super(key: key);

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Responsive(
        desktop: Text("desktop"),
        tablet: CallsList(),
        mobile: CallsList(),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
      ),
    );
  }
}

class CallsList extends StatelessWidget {
  const CallsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              child: Text(
                "Calls",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ...contactList(contacts, context)
          ],
        ),
      ),
    );
  }
}

contactList(Iterable<Contact> contacts, BuildContext context) {
  return contacts.map((v) => ContactListTile(
        contact: v,
        options: ContactListTileOptions(
            showMessageChips: false,
            suffixWidget: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: kDefaultPadding),
                  child: Text("5:37"),
                ),
                Icon(Icons.phone),
              ],
            ),
            bottomWidget: Text(
              randomPastDate.toString(),
              style: Theme.of(context).textTheme.caption,
            )),
      ));
}
