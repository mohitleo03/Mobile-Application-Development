import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/contact.dart';

class ContactList extends ConsumerWidget {
  StateProvider<List<Contact>> contactListProvider;
  ContactList(this.contactListProvider);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
        margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
        color: Colors.white,
        child: ListView.builder(
            itemCount: ref.watch(contactListProvider.state).state.length,
            itemBuilder: (context, index) {
              List<Contact> ContactList =
                            ref.watch(contactListProvider.state).state;
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade700,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  ContactList[index].name,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700),
                ),
                subtitle: Text(ContactList[index].number.toString()),
              );
            }));
  }
}
