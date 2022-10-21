import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  late TextEditingController tc;
  TextBox(this.tc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: tc,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.deepPurple)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
