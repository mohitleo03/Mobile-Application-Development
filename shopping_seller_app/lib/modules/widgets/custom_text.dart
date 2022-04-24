import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  late String label;
  late bool isMultiLine;
  late TextEditingController tc;
  late IconData prefixIcon;
  CustomText(
      {required this.label,
      this.isMultiLine = false,
      required this.tc,
      required IconData this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: tc,
        maxLines: isMultiLine ? 4 : 1,
        decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            hintText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
