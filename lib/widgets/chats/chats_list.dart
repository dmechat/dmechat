import 'package:dmechat/core/constants.dart';
import 'package:dmechat/core/models/models.dart';
import 'package:dmechat/data.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatefulWidget {
  const ChatsList({Key key}) : super(key: key);

  @override
  State<ChatsList> createState() => _ChatsList();
}

class _ChatsList extends State<ChatsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding * 2),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ContactsListHeader(),
            ContactsSearchBar(),
            FavoriteContacts(),
            DMContacts(),
            Rooms(),
            ArchivedChats()
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

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favoriteContacts = contacts.where((c) => c.isFavorite).take(6);

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Text("Favorites".toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium),
          ),
          ...contactList(favoriteContacts)
        ],
      ),
    );
  }
}

class DMContacts extends StatelessWidget {
  const DMContacts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dmContacts = contacts.take(6);

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
                  "Direct Messages".toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          ...contactList(dmContacts)
        ],
      ),
    );
  }
}

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
contactList(Iterable<Contact> contacts) {
  return contacts.map((v) => ContactListTile(
        contact: v,
        options: ContactListTileOptions(
          showMessageChips: true,
        ),
      ));
}

class ContactListTileOptions {
  bool showMessageChips = false;
  Widget suffixWidget = Container();
  Widget bottomWidget = Container();
  ContactListTileOptions({
    this.showMessageChips,
    this.suffixWidget,
    this.bottomWidget,
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
        onTap: () {},
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
