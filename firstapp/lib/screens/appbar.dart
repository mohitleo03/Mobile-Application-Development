import 'package:flutter/material.dart';

class appbar extends StatelessWidget {
  @override
  Widget build(BuildContext bt) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [Icon(Icons.phone),Icon(Icons.message)],
        backgroundColor: Colors.redAccent,
        title: Center(child: Text("Header")),
      ),
    );
  }
}
