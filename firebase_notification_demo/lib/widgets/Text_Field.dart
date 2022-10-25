import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  late String label;
  late TextEditingController tc;
  Size devicesize;
  TextBox(this.label, this.tc, this.devicesize);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: devicesize.width,
      child: TextFormField(
          controller: tc,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            focusColor: Colors.white,

            prefixIcon: Icon(
              Icons.person_outline_rounded,
              color: Colors.grey,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: Colors.grey,

            hintText: "$label",

            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontFamily: "verdana_regular",
              fontWeight: FontWeight.w400,
            ),

            labelText: '$label ',
            //lable style
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontFamily: "verdana_regular",
              fontWeight: FontWeight.w400,
            ),
          )),
    );
  }
}