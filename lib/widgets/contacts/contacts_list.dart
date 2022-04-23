import 'package:dmechat/core/constants.dart';
import 'package:dmechat/core/models/models.dart';
import 'package:dmechat/data.dart';
import 'package:dmechat/widgets/chats/chats_list.dart';
import 'package:flutter/material.dart';
import 'package:quick_log/quick_log.dart';

const _log = Logger("ContactsList");

class ContactsList extends StatefulWidget {
  const ContactsList({Key key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsList();
}

class _ContactsList extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding * 2),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContactsListHeader(),
            const ContactsSearchBar(),
            SortedContactsList(contacts: contacts.toList())
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
        "Contacts",
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
        hintText: "Search Contacts...",
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}

class SortedContactsList extends StatelessWidget {
  List<Contact> contacts;
  SortedContactsList({Key key, @required this.contacts}) : super(key: key);
  List<String> alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toLowerCase().split("");
  @override
  Widget build(BuildContext context) {
    var mappedContacts = alphabets.map((a) {
      var list =
          contacts.where((c) => c.name.toLowerCase().startsWith(a)).toList();
      return {
        "key": a,
        "list": list,
        "count": list.length,
      };
    });
    _log.fine("mappedContacts: $mappedContacts");
    return Column(
      children: mappedContacts
          .where((contact) => contact["count"] as int > 0)
          .map((contact) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Text(
                contact["key"].toString().toUpperCase(),
              ),
            ),
            ...contactList(contact["list"] as List<Contact>)
          ],
        );
      }).toList(),
    );
  }
}

contactList(Iterable<Contact> contacts) {
  return contacts.map((v) => ContactListTile(
        contact: v,
        options: ContactListTileOptions(
          showMessageChips: false,
        ),
      ));
}
