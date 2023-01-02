import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  final IconData icon;
  const CardIcon(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Icon(icon, size: 20),
    );
  }
}
