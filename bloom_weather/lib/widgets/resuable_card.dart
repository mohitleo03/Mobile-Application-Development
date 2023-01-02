import 'package:flutter/material.dart';

class ResusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  ResusableCard({@required this.color, this.cardChild});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(20),
    );
  }
}
