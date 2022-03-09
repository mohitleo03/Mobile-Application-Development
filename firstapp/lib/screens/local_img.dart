import 'package:flutter/material.dart';

class local_img extends StatelessWidget {
  @override
  Widget build(BuildContext bt) {
    const path = "images/food.jpg";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Header"),
      ),
      backgroundColor: Colors.lightBlue[200],
      body: Image.asset(path),
    );
  }
}
