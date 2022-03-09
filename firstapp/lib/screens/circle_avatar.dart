import 'package:flutter/material.dart';

class circle_avatar extends StatelessWidget {
  @override
  Widget build(BuildContext bt) {
    const path = "images/food.jpg";
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          boxShadow: [BoxShadow(color: Colors.black ,blurRadius: 50),BoxShadow(color: Colors.blue,blurRadius: 30)],
          border: Border.all(width: 1,color: Colors.black,style: BorderStyle.solid),
        ),
      
          child: CircleAvatar(
            radius: 200,
            backgroundImage: AssetImage(path),
          ),
        ),
      
    );
  }
}
