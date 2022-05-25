import 'package:firstapp/screens/row.dart';
import 'package:flutter/material.dart';

class verticalDividerExample extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      width: 100,
      child: Row(
        children: [
          Text("data"),
          VerticalDivider(
            color: Colors.black,
            thickness: 5,
          ),
          Text("data")
        ],
      ),
    );
  }
}