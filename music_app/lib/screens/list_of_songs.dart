import 'package:flutter/material.dart';

class ListOfSongs extends StatefulWidget {
  const ListOfSongs({ Key? key }) : super(key: key);

  @override
  State<ListOfSongs> createState() => _ListOfSongsState();
}

class _ListOfSongsState extends State<ListOfSongs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Songs"),),
      body: Container(),
    );
  }
}