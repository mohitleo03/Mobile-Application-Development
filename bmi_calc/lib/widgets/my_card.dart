import 'package:bmi_calc/widgets/cust_button.dart';
import 'package:flutter/material.dart';

class my_card extends StatelessWidget {
  Color Text_color = Color.fromARGB(171, 165, 167, 190);
  String label;
  int value;
  Size deviceSize;
  Function fn;
  my_card(this.label, this.value, this.deviceSize, this.fn);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 29, 30, 51),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
              style: TextStyle(fontSize: deviceSize.height/40, color: Text_color)),
          Text("$value",
              style: TextStyle(
                  fontSize: deviceSize.height / 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w900)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cust_button("-", fn),
              SizedBox(width: 10),
              cust_button("+", fn),
            ],
          )
        ],
      ),
    );
  }
}
