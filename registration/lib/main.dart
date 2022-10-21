import 'package:flutter/material.dart';
import 'package:registration/screens/material.dart';

import 'screens/registration_screen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FormScreen(),
    theme: ThemeData.dark(),
  ));
}
