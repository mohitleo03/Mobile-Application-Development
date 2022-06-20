import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task2/Screens/Dashboard1.dart';

import '../model/Contact.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home: Home(),
   
      ),
    );
    
  }
 
}


