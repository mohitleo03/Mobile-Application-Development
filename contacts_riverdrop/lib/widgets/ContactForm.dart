import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/contact.dart';

class ContactForm extends ConsumerWidget {
  StateProvider<List<Contact>> contactListProvider;
  ContactForm(this.contactListProvider);
  late Contact contact;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        child: Column(children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              controller: nameCtrl,
              decoration: InputDecoration(
                  label: Text('Full Name',
                      style: TextStyle(color: Colors.grey.shade700)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade700))),
            ),
            TextFormField(
              controller: numberCtrl,
              decoration: InputDecoration(
                  label: Text('Mobile',
                      style: TextStyle(color: Colors.grey.shade700)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade700))),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                contact = Contact(
                    name: nameCtrl.text, number: int.parse(numberCtrl.text));
                ref.read(contactListProvider.state).state.add(contact);
                nameCtrl.clear();
                numberCtrl.clear();
              },
              child: Text("Submit"),
              style: ElevatedButton.styleFrom(primary: Colors.grey.shade700),
            )
          ],
        )),
      )
    ]));
  }
}
