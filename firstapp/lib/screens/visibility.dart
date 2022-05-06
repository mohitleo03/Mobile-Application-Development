import 'package:flutter/material.dart';

class visibility extends StatefulWidget {
  @override
  State<visibility> createState() => _visibilityState();
}

class _visibilityState extends State<visibility> {
  bool isVisible = false;
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
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  // print(isVisible);
                  isVisible = !isVisible;
                  // print(isVisible);
                });
              },
              child: Text("Show Hide")),
          Visibility(
            visible: isVisible,
            child: Column(
              children: [
                Container(
                  // alignment: Alignment.center,
                  color: Colors.cyanAccent,
                  height: 200,
                  width: double.infinity,
                  child: FittedBox(
                      child: Text(
                    "Hello World",
                    textAlign: TextAlign.center,
                  )),
                ),
                // for(),
                ...listOfWidgets
              ],
            ),
          ),
        ],
      )),
    );
  }
}
