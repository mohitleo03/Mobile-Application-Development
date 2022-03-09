import 'package:flutter/material.dart';

class net_img extends StatelessWidget {
  @override
  Widget build(BuildContext bt) {
    const path = "https://giffiles.alphacoders.com/209/209542.gif";
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Header"),
        ),
        backgroundColor: Colors.lightBlue[200],
        //body: Image.network("https://upload.wikimedia.org/wikipedia/en/b/bd/Doraemon_character.png"),   static image
        body: Image.network(path) //.gif image
        );
  }
}
