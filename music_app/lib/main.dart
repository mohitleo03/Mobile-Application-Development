import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Screens/List_of_songs.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Music App 2022",
    home: ListOfSongs(),
  ));
}
