import 'package:flutter/material.dart';

class mycard extends StatelessWidget {
  @override
  Widget grocery_card(BuildContext context) {
    String path = "./images/Grocery.png";
    return Card(
      child: Column(
        children: [
          Image(image: AssetImage(path), height: 115, width: 170),
          Text("Popular Items")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
