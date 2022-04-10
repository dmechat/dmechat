import 'dart:math';

import 'package:dmechat/core/theme.dart';
import 'package:dmechat/screens/chat_home_screen.dart';
import 'package:flutter/material.dart';

class ChatContacts extends StatelessWidget implements PreferredSizeWidget {
  ChatContacts({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.purple.shade300,
      ),
      child: ListView(
        children: List.generate(
            10,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Person Name"),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
