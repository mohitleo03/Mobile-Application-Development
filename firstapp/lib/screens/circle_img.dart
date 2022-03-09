import 'package:flutter/material.dart';

class circle_img extends StatelessWidget {
  @override
  Widget build(BuildContext bt) {
    const path = "images/deadpool.png";
    return Scaffold(
      backgroundColor: Colors.yellow,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
            image: DecorationImage(image: AssetImage(path))),
        ),
      ),
    );
  }
}
