import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedcontainerExample extends StatefulWidget {
  const AnimatedcontainerExample({Key? key}) : super(key: key);

  @override
  State<AnimatedcontainerExample> createState() => _AnimatedcontainerExampleState();
}

class _AnimatedcontainerExampleState extends State<AnimatedcontainerExample> {
  var random = Random();
  double _width = 70;
  double _height = 70;
  Color _color = Colors.blue;
  double _borderRadius = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_borderRadius),
              color: _color,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // changeAnimation();
                  _width = random.nextInt(200).toDouble();
        _height = random.nextInt(200).toDouble();
        _color = Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1,
        );
        _borderRadius = random.nextInt(20).toDouble();
        setState(() {});
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
