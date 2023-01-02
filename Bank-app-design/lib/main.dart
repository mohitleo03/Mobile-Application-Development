import 'package:dashboard_design/pages/home_page.dart';
import 'package:dashboard_design/pages/send_money_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Design',
      home: HomePage(),
    );
  }
}
