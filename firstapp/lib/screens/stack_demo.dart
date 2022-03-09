import 'package:flutter/material.dart';

class stack_demo extends StatelessWidget {
  _getContainer(Color color, {double width = 100, double height = 100}) {
    return Container(
      color: color,
      height: height,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Demo"),
      ),
      body: Stack(
        
        fit: StackFit.expand,
        children: [
          _getContainer(Colors.red,width: 500,height: 500),
          Positioned(child: _getContainer(Colors.green,width: 300,height: 300)),
          Positioned(child: _getContainer(Colors.blue),bottom: 10, right: 50,),
        ],
      ),
    );
  }
}
