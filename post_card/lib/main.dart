import 'package:flutter/material.dart';
import 'package:post_card/constants.dart';
import 'package:post_card/data.dart';
import 'package:post_card/widgets/appbar.dart';
import 'package:post_card/widgets/bottom_appbar.dart';
import 'package:post_card/widgets/post_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Appbar(),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomAppbar(),
        backgroundColor: black,
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (_, index) {
            return PostCard(post: posts[index]);
          },
        ));
  }
}
