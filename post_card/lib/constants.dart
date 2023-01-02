import 'package:flutter/material.dart';

// colors
const black = Color(0xff1C1C1C);
const white = Color(0xffffffff);
const darkGrey = Color(0xff2B2B2B);
const lightGrey = Color.fromARGB(255, 85, 84, 84);
const bluishPink = Color(0xffA467D5);
const pink = Color(0xffE85587);

// fonts
const String freehand = 'Freehand';
const String patrickHand = 'PatrickHand';

// gradient
const greyGradient = LinearGradient(
  colors: [lightGrey, darkGrey],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.0, 0.4],
);

// ui elements

const floatingActionButton = FloatingActionButton(
  onPressed: null,
  backgroundColor: pink,
  child: Icon(Icons.add, color: white),
);
