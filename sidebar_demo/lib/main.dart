import 'package:flutter/material.dart';
import 'package:sidebar_demo/sidebar/sidebar_layout.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
    ),
    home: SideBarLayout(),
  ));
}
