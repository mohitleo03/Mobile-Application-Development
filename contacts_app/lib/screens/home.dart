import 'package:contacts_app/widgets/ContactForm.dart';
import 'package:contacts_app/widgets/ContactList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text("Contact List",style: TextStyle(color: Colors.grey.shade700))),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: deviceSize.height/4,
              child: ContactForm(),
            ), 
            Container(
              height: deviceSize.height*3/4 - 90,
              child: ContactList(),
            )
            ],
        ),
      ),
    );
  }
}
