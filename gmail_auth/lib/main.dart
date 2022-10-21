import 'package:budgetmanager/provider/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/login/screen/login.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

runApp(ChangeNotifierProvider(
  create: (BuildContext context)=>GoogleSignInProvider(),
  child:   MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Login(),
  
  
  
    ),
));
}
