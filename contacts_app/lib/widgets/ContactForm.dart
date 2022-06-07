import 'package:contacts_app/cubit/contact_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/contact.dart';

class ContactForm extends StatelessWidget {
  late Contact contact;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ContactListCubit cubit = BlocProvider.of<ContactListCubit>(context);
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
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade700))
              ),
            ),
            TextFormField(
              controller: numberCtrl,
              decoration: InputDecoration(
                  label: Text('Mobile',
                      style: TextStyle(color: Colors.grey.shade700)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade700))
              ),
                      
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                contact = Contact(
                    name: nameCtrl.text, number: int.parse(numberCtrl.text));
                cubit.add(contact);
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
