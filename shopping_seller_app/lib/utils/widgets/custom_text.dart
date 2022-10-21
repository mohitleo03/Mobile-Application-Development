import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomText extends StatelessWidget {
  late String label;
  late bool isMultiLine;
  late TextEditingController tc;
  late IconData prefixIcon;
  late bool isObscureText;
  late double price;
  late bool isDigitInput;
  CustomText(
      {required this.label,
      this.isMultiLine = false,
      required this.tc,
      required this.prefixIcon,
      this.isObscureText = false,
      this.price = 0,
      this.isDigitInput = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.all(10),
      child: TextField(
        keyboardType: isDigitInput ? TextInputType.number : TextInputType.text,
        obscureText: isObscureText,
        controller: tc,
        maxLines: isMultiLine ? 4 : 1,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.deepPurple)),
            prefixIcon: Icon(prefixIcon,color: Colors.deepPurple,),
            hintText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
