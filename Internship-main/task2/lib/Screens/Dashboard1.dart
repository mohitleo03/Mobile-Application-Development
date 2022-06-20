import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Provider/contact_provider.dart';
import '../Provider/providers.dart';
import '../model/contact.dart';
const darkBlueColor = Color(0xff486579);
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   final _formKey = GlobalKey<FormState>();
  TextEditingController _ctrlMobile = TextEditingController();
  TextEditingController _ctrlName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        centerTitle: true,
         backgroundColor: Colors.white,
        title: Text('Contact List',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),), 
    ), 
    body: SafeArea(child: Form(
       key: _formKey,
          child: Column(
          children: <Widget>[ 
            TextFormField(  
            controller: _ctrlName,
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter your name',  
              labelText: 'Full Name',  
            ), 
            ), 
          TextFormField(  
            controller: _ctrlMobile,
            decoration: const InputDecoration(  
              icon: const Icon(Icons.phone),  
              hintText: 'Enter a phone number',  
              labelText: 'Phone',  
             ), 
           ),
            Container(  
            margin: EdgeInsets.all(25), 
              child :
              Consumer(builder: ((context, watch, child) {
                  final ContactListController controller =
                      context.read(conatctListProvider.notifier);

                  return ElevatedButton(
                    onPressed: () {
                      controller.addContact(Contact(_ctrlName .text, _ctrlMobile.text));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 8, 84, 217)),
                    child: const Text(
                      'SUBMIT',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  );
                })),
          ),
          _list(),
  ], )
   )
     ),
   );
  
  }
  
_list() => Expanded(
    child: Card(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Scrollbar(
        child: 
        Consumer(builder: ((context, watch, child) {
          final contactList = watch(conatctListProvider);
          
          return ListView.builder (
           itemCount: contactList.length,
                       
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
           
                         
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: darkBlueColor,
                    size: 40.0,
                  ),
                  title: Text(
                    contactList[index].name.toUpperCase(),
                    style: TextStyle(
                        color: darkBlueColor, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(contactList[index].mobile.toString()),
                 
                ),
                Divider(
                  height: 5.0,
                ),
              ],
            );
          },
        
        );
        }
        ))

       
      ),
    ),
  );
}

