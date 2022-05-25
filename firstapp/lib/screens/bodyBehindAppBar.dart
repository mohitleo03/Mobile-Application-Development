import 'package:flutter/material.dart';
class bodyBehindAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        elevation: 0,
      ),
      body: ListView.builder(itemBuilder: (context,index )=>Container(
        margin: EdgeInsets.only(top: 5,bottom: 5),
        height: 200,
        width: double.infinity,
        color: Colors.green,
      )),
    );
  }
}