import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/registration_screen.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MaterialApp(
    title: "FireBase Example",
    theme: ThemeData(),
    home: RegisterScreen(),
  ));
}