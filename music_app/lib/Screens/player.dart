import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({ Key? key }) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent,
      ),
    );
  }
}