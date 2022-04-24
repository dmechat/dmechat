import 'dart:math';

import 'package:dmechat/core/constants.dart';
import 'package:dmechat/core/models/models.dart';
import 'package:dmechat/data.dart';
import 'package:dmechat/widgets/chats/chats_list.dart';
import 'package:flutter/material.dart';
import 'package:dice_bear/dice_bear.dart';

class ContactsChatScreen extends StatelessWidget {
  static String routeName = "/chat";
  Contact person;
  ContactsChatScreen({Key key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (person == null) {
      return Container();
    }
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          PersonHeaderContent(contact: person),
          Flexible(
              child:
                  SingleChildScrollView(child: ChatMessages(contact: person))),
          ChatInputField(),
        ],
      ),
    );
  }
}

class PersonHeaderContent extends StatelessWidget {
  Contact contact;
  PersonHeaderContent({Key key, @required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(contact.imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "Active",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
          Spacer(),
          ChatActionIcons()
        ],
      ),
    );
  }
}

class ChatActionIcons extends StatelessWidget {
  const ChatActionIcons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.phone_in_talk),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.video_call),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.info),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ],
    );
  }
}

class ChatMessages extends StatelessWidget {
  Contact contact;
  ChatMessages({Key key, @required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var messages =
        chatMessages.elementAt(Random().nextInt(chatMessages.length));

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: messages.visibleMessages
            .map(
              (m) => Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: messageWidget(m, context),
              ),
            )
            .toList());
  }

  Widget messageWidget(ChatMessage m, BuildContext context) {
    if (m.type == MessageType.text) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contactName(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade100),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 10)),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Expanded(
                    child: SelectableText(
                      "${m.content} ${m.content} ${m.content}",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    if (m.type == MessageType.image) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contactName(),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: DiceBearBuilder(seed: m.content)
                .build()
                .toImage(height: 100, width: 100),
          ),
        ],
      );
    }
    if (m.type == MessageType.audio) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contactName(),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: AudioMessage(
              message: m,
            ),
          ),
        ],
      );
    }
    if (m.type == MessageType.video) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contactName(),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: VideoMessage(),
          ),
        ],
      );
    }
    if (m.type == MessageType.file) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contactName(),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade100),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade100,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 10)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Row(
                  children: [
                    Icon(Icons.attachment),
                    Padding(
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "design-phase-1-draft.pdf",
                            style: Theme.of(context).textTheme.button,
                          ),
                          Text(
                            "12.5 MB",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.download)
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Container();
  }

  Row contactName() {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.name),
          ],
        ),
      ),
    ]);
  }
}

class AudioMessage extends StatelessWidget {
  final ChatMessage message;
  const AudioMessage({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColor.withOpacity(1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            // color: message!.isSender ? Colors.white : kPrimaryColor,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.black,
                    //  message!.isSender
                    //     ? Colors.white
                    //     : kPrimaryColor.withOpacity(0.4),
                  ),
                  Positioned(
                    left: 15,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            "0.37",
            style: TextStyle(
              fontSize: 12,
              // color: message!.isSender ? Colors.white : null,
            ),
          ),
        ],
      ),
    );
  }
}

class VideoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45, // 45% of total width
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: DiceBearBuilder(seed: "m.content").build().toImage(),
            ),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                size: 16,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Icon(Icons.mic, color: kPrimaryColor),
            SizedBox(width: kDefaultPadding),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.64),
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.64),
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.64),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
