import 'dart:convert';

import 'package:dmechat/core/app_state.dart';
import 'package:dmechat/core/constants.dart';
import 'package:dmechat/core/models/models.dart';
import 'package:dmechat/data.dart';
import 'package:dmechat/injection_container.dart';
import 'package:dmechatapi/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_log/quick_log.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dice_bear/dice_bear.dart';

const _logger = Logger("ChatsList");

class ChatsList extends StatefulWidget {
  Function(Contact) onTap = (c) {};
  ChatsList({Key key, this.onTap}) : super(key: key);

  @override
  State<ChatsList> createState() => _ChatsList(onTap);
}

class _ChatsList extends State<ChatsList> {
  Function onTap;
  List<Contact> favoriteContacts =
      contacts.where((c) => c.isFavorite).take(6).toList();
  List<Contact> dms = [];
  _ChatsList(this.onTap) {
    var api = sl<DmechatApi>();
    List<Contact> _users = [];
    api.listAvailableUsers().then((users) {
      for (var user in users) {
        _users.add(
          Contact(
              accountId: user.publicKey,
              name: user.accountName,
              id: user.accountName,
              imageUrl: DiceBearBuilder(seed: user.accountName)
                  .build()
                  .svgUri
                  .toString()),
        );
      }
      setState(() {
        dms = _users;
      });
    }).catchError((error) {
      _logger.error(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactsListHeader(),
            ContactsSearchBar(),
            // ContactListTiles(
            //   onTap: onTap,
            //   contacts: favoriteContacts,
            //   header: "Favorites",
            // ),
            ContactListTiles(
              onTap: onTap,
              contacts: dms,
              header: "Direct Messages",
            ),
            // DMContacts(),
            // Rooms(),
            // ArchivedChats()
          ],
        ),
      ),
    );
  }
}

class ContactsListHeader extends StatelessWidget {
  const ContactsListHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        "Chats",
        style: Theme.of(context).textTheme.headline4,
      ),
      IconButton(onPressed: () {}, icon: const Icon(Icons.add))
    ]);
  }
}

class ContactsSearchBar extends StatefulWidget {
  const ContactsSearchBar({Key key}) : super(key: key);

  @override
  State<ContactsSearchBar> createState() => _ContactsSearchBarState();
}

class _ContactsSearchBarState extends State<ContactsSearchBar> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Search",
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}

class ContactListTiles extends StatelessWidget {
  Function(Contact) onTap = (c) {};
  List<Contact> contacts;
  String header;
  ContactListTiles(
      {Key key, this.onTap, @required this.contacts, @required this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Text(header.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium),
          ),
          ...contactList(contacts, onTap)
        ],
      ),
    );
  }
}

// class DMContacts extends StatelessWidget {
//   const DMContacts({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var dmContacts = ;

//     return Padding(
//       padding: const EdgeInsets.only(top: kDefaultPadding * 2),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: kDefaultPadding),
//             child: Row(
//               children: [
//                 Text(
//                   "Direct Messages".toUpperCase(),
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ],
//             ),
//           ),
//           ...contactList(dmContacts, (Contact c) {})
//         ],
//       ),
//     );
//   }
// }

class Rooms extends StatelessWidget {
  const Rooms({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Row(
              children: [
                Text(
                  "Channels".toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          ...roomsList(rooms)
        ],
      ),
    );
  }
}

class ArchivedChats extends StatelessWidget {
  const ArchivedChats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Archived",
            style: Theme.of(context).textTheme.caption,
          ),
          const Icon(
            Icons.archive,
            size: kSmallIconSize,
          ),
        ],
      ),
    );
  }
}

/// This needs to be a widget
contactList(Iterable<Contact> contacts, Function onTap) {
  return contacts.map((v) => ContactListTile(
        contact: v,
        options: ContactListTileOptions(
          showMessageChips: true,
          onTap: onTap,
        ),
      ));
}

class ContactListTileOptions {
  bool showMessageChips = false;
  Widget suffixWidget = Container();
  Widget bottomWidget = Container();
  Function(Contact) onTap = (Contact c) {};
  ContactListTileOptions({
    this.showMessageChips,
    this.suffixWidget,
    this.bottomWidget,
    this.onTap,
  });
}

class ContactListTile extends StatelessWidget {
  Contact contact;
  ContactListTileOptions options;
  ContactListTile({
    Key key,
    @required this.contact,
    this.options,
  }) : super(key: key) {
    options ??= ContactListTileOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: () => options.onTap(contact),
        child: Row(children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(contact.imageUrl),
              ),
              Container(
                  height: kIndicatorSize,
                  width: kIndicatorSize,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kOnlineDotColor,
                      border:
                          Border.all(color: kOnlineDotColor.withOpacity(1.0))))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.name),
                if (options.bottomWidget != null) options.bottomWidget,
              ],
            ),
          ),
          const Spacer(),
          if (options.showMessageChips == true) const Chip(label: Text("2")),
          if (options.suffixWidget != null) options.suffixWidget,
        ]),
      ),
    );
  }
}

roomsList(List<Room> rooms) {
  return rooms.map((v) => Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding * 3),
                  child: Text(
                    v.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                flex: 9,
              ),
              // const Spacer(flex: 1),
              const Chip(label: Text("2"))
            ],
          ),
        ),
      ));
}
