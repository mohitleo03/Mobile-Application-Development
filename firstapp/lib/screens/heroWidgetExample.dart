import 'package:flutter/material.dart';

class heroWidgetExample extends StatelessWidget {
  const heroWidgetExample({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: "NatureImage",
        child: Container(
          child: Image.network("https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__340.jpg",
          fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}