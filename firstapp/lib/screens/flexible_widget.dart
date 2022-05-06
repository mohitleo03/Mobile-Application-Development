import 'package:flutter/material.dart';

class flexibleWidget extends StatelessWidget {
  const flexibleWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Flexible(child: Container(color: Colors.red,),flex: 1),
        Flexible(child: Container(color: Colors.green,),flex: 2),
        Flexible(child: Container(color: Colors.blue,),flex: 3),
      ]),
    );
  }
}