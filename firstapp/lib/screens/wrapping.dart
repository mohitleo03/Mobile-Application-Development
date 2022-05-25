import 'package:flutter/material.dart';

class wrapWidget extends StatelessWidget {
  const wrapWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(
        children: [
          Container(
              // alignment: Alignment.center,
              color: Colors.cyanAccent,
              height: 200,
              width: double.infinity,
              child: FittedBox(child: Text("Hello World",textAlign: TextAlign.center,)),
            ),
        ],
      )),
    );
  }
}