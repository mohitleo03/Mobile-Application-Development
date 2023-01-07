import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class CustomSnackBar {
  CustomSnackBar(BuildContext context, Widget content,
      {SnackBarAction? snackBarAction, Color backgroundColor = Colors.blue}) {
    final SnackBar snackBar = SnackBar(
        backgroundColor: backgroundColor,
        content: content,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
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
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Message')));
                  },
                  child: const Text("1")),
              ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Message');
                  },
                  child: const Text("2")),
              ElevatedButton(
                  onPressed: () {
                    CustomSnackBar(context, const Text('Message'));
                  },
                  child: const Text("3")),
            ],
          ),
        ),
      ),
    );
  }
}
