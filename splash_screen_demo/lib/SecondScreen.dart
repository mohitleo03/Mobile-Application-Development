import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Second Screen"),
      ),
    );
  }
}