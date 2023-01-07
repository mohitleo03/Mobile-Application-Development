import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: deviceSize.width,
          height: deviceSize.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Message')));
                  },
                  child: const Text("1")),
              ElevatedButton(onPressed: () {
                      Fluttertoast.showToast(msg: 'Message');

              }, child: const Text("2")),
              ElevatedButton(onPressed: () {}, child: const Text("3")),
              ElevatedButton(onPressed: () {}, child: const Text("4")),
              ElevatedButton(onPressed: () {}, child: const Text("5")),
              ElevatedButton(onPressed: () {}, child: const Text("6")),
              ElevatedButton(onPressed: () {}, child: const Text("7")),
              ElevatedButton(onPressed: () {}, child: const Text("8")),
              ElevatedButton(onPressed: () {}, child: const Text("9")),
              ElevatedButton(onPressed: () {}, child: const Text("10")),
              ElevatedButton(onPressed: () {}, child: const Text("11")),
            ],
          ),
        ),
      ),
    );
  }
}
