import 'package:flutter/material.dart';

class Home2Page extends StatefulWidget {
  const Home2Page({Key? key}) : super(key: key);

  @override
  State<Home2Page> createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home--2"),
      ),
      body: const Center(
        child: Text("Home page two"),
      ),
    );
  }
}
