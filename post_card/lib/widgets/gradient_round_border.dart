import 'package:flutter/material.dart';

import '../constants.dart';

class GradientBorder extends StatelessWidget {
  final ImageProvider? image;
  final Widget? child;

  const GradientBorder({super.key, this.child, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [bluishPink, pink, bluishPink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: child,
      ),
    );
  }
}
