import 'package:flutter/material.dart';

class embededListOr_SPREAD_OPERATOR extends StatelessWidget {
    final List<Widget> listOfWidgets = [
    Text("data"),
    Text("data"),
    Text("data"),
    Text("data"),
    Text("data"),
    Text("data"),
    Text("data"),
    Text("data"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
          Text("data"),
          Column(children:[
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data")
            ]),
          for(Widget myWidget in listOfWidgets) myWidget,
          ...listOfWidgets
          ],
        ),
      ),
    );
  }
}