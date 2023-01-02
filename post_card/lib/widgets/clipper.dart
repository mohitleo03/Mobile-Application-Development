import 'package:flutter/material.dart';

class ContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0986800);
    path0.quadraticBezierTo(
        size.width * -0.0022000, size.height * 0.0006800, size.width * 0.0620750, 0);
    path0.cubicTo(size.width * 0.2809844, 0, size.width * 0.7188031, 0, size.width * 0.9377125, 0);
    path0.quadraticBezierTo(
        size.width * 1.0007875, size.height * -0.0009200, size.width, size.height * 0.1003000);
    path0.quadraticBezierTo(
        size.width, size.height * 0.4780750, size.width, size.height * 0.6040000);
    path0.quadraticBezierTo(size.width * 1.0025000, size.height * 0.6975000, size.width * 0.9350000,
        size.height * 0.6980000);
    path0.quadraticBezierTo(size.width * 0.7962500, size.height * 0.6965000, size.width * 0.7500000,
        size.height * 0.6960000);
    path0.quadraticBezierTo(size.width * 0.6903125, size.height * 0.6960000, size.width * 0.6862500,
        size.height * 0.8000000);
    path0.quadraticBezierTo(size.width * 0.6871875, size.height * 0.8735000, size.width * 0.6875000,
        size.height * 0.8980000);
    path0.quadraticBezierTo(
        size.width * 0.6871875, size.height * 0.9935000, size.width * 0.6262500, size.height);
    path0.quadraticBezierTo(
        size.width * 0.2015625, size.height, size.width * 0.0600000, size.height);
    path0.quadraticBezierTo(0, size.height * 0.9990000, 0, size.height * 0.9000000);
    path0.lineTo(0, size.height * 0.0986800);
    path0.close();

    // add this line at the end
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
