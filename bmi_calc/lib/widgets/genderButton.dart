import 'package:flutter/material.dart';

class genderButton extends StatelessWidget {
  String text;
  IconData icon;
  genderButton(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 17, 19, 40)
      ),
      child: Column(
        children: [Icon(icon), Text(text)],
      ),
    );
  }
}
