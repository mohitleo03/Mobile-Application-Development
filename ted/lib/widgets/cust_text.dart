import 'package:flutter/material.dart';

class cust_text extends StatelessWidget {
  late String Txt;
  cust_text(String txt) {
    this.Txt = txt;
  }
  @override
  Widget build(BuildContext bt) {
    return Text(Txt);
  }
}
