import 'package:flutter/material.dart';

class visibility extends StatefulWidget {
  @override
  State<visibility> createState() => _visibilityState();
}

class _visibilityState extends State<visibility> {
  bool isVisible = false;


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
                  isVisible = !isVisible;

                });
              },
              child: Text(isVisible?"Hide":"Show")),
          Visibility(
            visible: isVisible,
            child: Column(
              children: [
                Container(
                  color: Colors.cyanAccent,
                  height: 200,
                  width: double.infinity,
                  child: FittedBox(
                      child: Text(
                    "Hello World",
                    textAlign: TextAlign.center,
                  )),
                ),

              ],
            ),
          ),
        ],
      )),
    );
  }
}
