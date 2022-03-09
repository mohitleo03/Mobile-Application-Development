import 'package:flutter/material.dart';

class scaff extends StatelessWidget {
  @override
  Widget build(BuildContext bt) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[200],
        body: SafeArea(
            child: Text(
          "In scaffold",
          style: TextStyle(backgroundColor: Colors.white, fontSize: 30),
        )));
  }
}
