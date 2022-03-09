import 'dart:math';

import 'package:flutter/material.dart';

class transform_rotate extends StatelessWidget {
  @override
  Widget build(BuildContext bt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform Rotate"),
      ),
      body:Container(
        width: 300,
        height: 300,
        transform: Matrix4.rotationZ(pi/3),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black ,blurRadius: 50),BoxShadow(color: Colors.blue,blurRadius: 30)],
          border: Border.all(width: 1,color: Colors.black,style: BorderStyle.solid),
          gradient: LinearGradient(
            colors: [Colors.red,Colors.green,Colors.blue],begin: Alignment.topLeft, end: Alignment.bottomRight
            ),
            
            ),
      )
    );
  }
}
