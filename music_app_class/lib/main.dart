import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music_app_class/screens/list_of_songs.dart';
import 'package:music_app_class/themes/color_theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    theme: getColorTheme(),
    debugShowCheckedModeBanner: false,
    title: "Music app 2022",
    home: ListOfSongs(),
  ));
}