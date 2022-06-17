import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/contact.dart';
import '../widgets/ContactForm.dart';
import '../widgets/ContactList.dart';

class Home extends StatelessWidget {
  StateProvider<List<Contact>> contactListProvider;
  Home(this.contactListProvider);

  @override
  Widget build(BuildContext context) {
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
              child: ContactForm(contactListProvider),
            ),
            Container(
              height: deviceSize.height * 3 / 4 - 90,
              child: ContactList(contactListProvider),
            )
          ],
        ),
      ),
    );
  }
}
