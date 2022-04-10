import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class Player extends StatefulWidget {
  Song song;
  Player(this.song);

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
