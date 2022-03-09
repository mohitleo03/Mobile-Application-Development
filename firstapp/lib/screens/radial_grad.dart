import 'package:flutter/material.dart';

class radial_grad extends StatelessWidget {
  @override
  Widget build(BuildContext bt) {
    const path = "images/avengers.png";
    return Scaffold(
      appBar: AppBar(
        title: Text("Radial Gradient"),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: RadialGradient(
              colors: [  Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red,Colors.white],
              // begin: Alignment.topCenter,    radial doesn't have any end or begin property
              // end: Alignment.
            stops: [0.19,0.29,0.39,0.49,0.59,0.69,0.85,0.99]
            )
          ),
        child: Image(image: AssetImage(path)),
        ),
      ),
      );
  }
}