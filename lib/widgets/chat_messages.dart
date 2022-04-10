import 'dart:math';

import 'package:dmechat/core/theme.dart';
import 'package:dmechat/screens/chat_home_screen.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget implements PreferredSizeWidget {
  ChatMessages({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Column(
        children: [
          Flexible(
            child: ListView(
              reverse: true,
              children: List.generate(
                100,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index % 2 == 0
                        ? Colors.blue.shade100
                        : Colors.purple.shade100,
                  ),
                  child: SelectableText(index % 2 == 0
                      ? "Their message: " + index.toString()
                      : "Your message: " + index.toString()),
                ),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade400,
            ),
            child: const TextField(),
          )
        ],
      ),
    );
  }
}
