import 'package:dmechat/core/constants.dart';
import 'package:dmechat/data.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding * 2),
      child: Column(
        children: [
          ContactsListHeader(),
          ContactsSearchBar(),
          FavoriteContacts(),
          Text("direct messages"),
          Text("channels"),
        ],
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
    var map = contacts.where((c) => c.isFavorite).map((v) => Text(v.name));
    return Container(
      child: Column(
        children: [
          Text("Favorites", style: Theme.of(context).textTheme.caption),
          ...map
        ],
      ),
    );
  }
}
