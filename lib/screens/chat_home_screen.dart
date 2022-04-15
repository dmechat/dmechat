import 'package:dmechat/widgets/appbar.dart';
import 'package:dmechat/widgets/chat_contacts.dart';
import 'package:dmechat/widgets/chat_messages.dart';
import 'package:flutter/material.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger("InitialScreen");

class ChatHomeScreen extends StatelessWidget {
  static String routeName = "/chat";
  const ChatHomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(routeTitle: "dmechat", actions: const []),
      body: Center(
        child: Row(
          children: [
            Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChatContacts(),
                ),
                flex: 3),
            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
              indent: 20,
              endIndent: 0,
              width: 20,
            ),
            Flexible(child: ChatMessages(), flex: 9),
          ],
        ),
      ),
    );
  }
}
