import 'package:bmi_calc/widgets/cust_button.dart';
import 'package:flutter/material.dart';

class my_card extends StatelessWidget {
  String label;
  int value;
  Size deviceSize;
  Function fn;
  my_card(this.label, this.value, this.deviceSize,this.fn);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 29, 30, 51),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(label,
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
          Text("$value",
              style: TextStyle(
                  fontSize: deviceSize.height / 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w900)),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cust_button("-",fn),
                SizedBox(width: 10),
                cust_button("+",fn),
              ],
            ),
          )
        ],
      ),
    );
  }
}
