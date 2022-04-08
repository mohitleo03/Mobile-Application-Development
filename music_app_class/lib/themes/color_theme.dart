import 'package:flutter/material.dart';

ThemeData getColorTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.amberAccent,
    backgroundColor: Colors.yellowAccent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.greenAccent,
      foregroundColor: Colors.greenAccent)
  );
}
