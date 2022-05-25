import 'package:flutter/material.dart';

class bottom_sheet_widget extends StatelessWidget {
  show_Bottom_Sheet(context) {
    ScaffoldKey.currentState?.showBottomSheet((context) {
          return Container(
            height: 400,
            color: Colors.green,
            child: Center(child: Text("This is Bottom Sheet")),
          );
        });
  }

  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,
      appBar: AppBar(
        title: Text("Bottom Sheet Example"),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              show_Bottom_Sheet(context);
            },
          )
        ],
      ),
    );
  }
}
