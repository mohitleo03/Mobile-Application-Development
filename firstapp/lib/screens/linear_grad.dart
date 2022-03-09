import 'package:flutter/material.dart';

class liner_grad extends StatelessWidget {
  @override
  Widget build(BuildContext bt) {
    const path = "images/avengers.png";
    return Scaffold(
      appBar: AppBar(
        title: Text("Linear Gradient"),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [  Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red,Colors.white],
              // colors: [  Colors.black12,Colors.blueAccent],
              // begin: Alignment.topCenter,
              // end: Alignment.bottomRight
            )
          ),
        child: Image(image: AssetImage(path)),
        ),
      ),
      );
  }
}