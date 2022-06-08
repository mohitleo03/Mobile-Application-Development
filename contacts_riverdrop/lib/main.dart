import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/contact.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Home(),
  )));
}

StateProvider<List<Contact>> contactListProvider = StateProvider((ref) => []);

class Home extends ConsumerWidget {
  late Contact contact;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  Widget build(BuildContext context, WidgetRef ref) {
    print("ref data is ${ref.watch(contactListProvider.state).state.length}");
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text("Contact List",
                style: TextStyle(color: Colors.grey.shade700))),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: deviceSize.height / 4,
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameCtrl,
                      decoration: InputDecoration(
                          label: Text('Full Name',
                              style: TextStyle(color: Colors.grey.shade700)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade700))),
                    ),
                    TextFormField(
                      controller: numberCtrl,
                      decoration: InputDecoration(
                          label: Text('Mobile',
                              style: TextStyle(color: Colors.grey.shade700)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade700))),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        contact = Contact(
                            name: nameCtrl.text,
                            number: int.parse(numberCtrl.text));
                        ref.read(contactListProvider.state).state.add(contact);
                        nameCtrl.clear();
                        numberCtrl.clear();
                      },
                      child: Text("Submit"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade700),
                    )
                  ],
                ),
              ),
            ),
            Container(
                height: deviceSize.height * 3 / 4 - 90,
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount:
                          ref.watch(contactListProvider.state).state.length,
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
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
