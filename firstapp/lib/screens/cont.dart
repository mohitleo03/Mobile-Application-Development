import 'package:firstapp/screens/appbar.dart';
import 'package:flutter/material.dart';

class cont extends StatelessWidget{
  @override
  Widget build(BuildContext bt){
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.red,Colors.green,Colors.blue])),
        child: Center(child: Text("Container in green")),
      ),
    );
  }
}