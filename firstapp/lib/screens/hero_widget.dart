import 'package:flutter/material.dart';

class heroWidget extends StatefulWidget {
  const heroWidget({ Key? key }) : super(key: key);

  @override
  State<heroWidget> createState() => _heroWidgetState();
}

class _heroWidgetState extends State<heroWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Hero(
            tag: "Nature Image",
            child: Container(
              color: Colors.green,
              height: 200,
              width: 100,
              child: Image.network("https://img.freepik.com/free-photo/orchid-flower-against-blue-background_23-2149244138.jpg?w=360",fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}