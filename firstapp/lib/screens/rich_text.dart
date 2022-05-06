import 'package:flutter/material.dart';

class RichTextExample extends StatelessWidget {
  const RichTextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: RichText(
              text: TextSpan(
                  children: [
                    TextSpan(text: "hello", style: TextStyle(color: Colors.black)),
                    TextSpan(text: "world", style: TextStyle(color: Colors.red,fontSize: 30)),
                    ],
                  )
              )
          ),
    );
  }
}
