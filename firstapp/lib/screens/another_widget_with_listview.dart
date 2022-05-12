import 'package:flutter/material.dart';

class list extends StatelessWidget {
  List<Color> colors = [Colors.red,Colors.green,Colors.blue,Colors.redAccent,Colors.amberAccent,Colors.blueGrey,Colors.cyan,Colors.indigo];

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            width: deviceSize.width,
            height: deviceSize.height,
          ),
          Container(
              width: deviceSize.width,
              height: deviceSize.height / 2,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Container(
                  height: 100,
                  width: deviceSize.width,
                  color: colors[index],
                ),
                itemCount: 8,
              ))
        ],
      )),
    );
  }
}
