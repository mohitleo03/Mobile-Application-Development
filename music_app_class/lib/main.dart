import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music_app_class/screens/list_of_songs.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Music app 2022",
    home: ListOfSongs(),
  ));
}
