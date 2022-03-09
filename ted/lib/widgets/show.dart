import 'package:flutter/material.dart';

class show extends StatelessWidget {


  Widget shows(String path) {
    return Stack(
      children: [
        Image.network(path)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}