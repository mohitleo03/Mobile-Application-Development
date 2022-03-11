import 'package:flutter/material.dart';

import 'screens/registration_screen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: registration_screen(),
    theme: ThemeData.dark(),
  ));
}
