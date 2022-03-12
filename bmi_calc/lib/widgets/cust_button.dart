import 'package:flutter/material.dart';

class cust_button extends StatelessWidget {
  String Symbol;
  Function fn;
  cust_button(this.Symbol, this.fn);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (Symbol == '+')
            fn(1);
          else
            fn(-1);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 76, 79, 93)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            fixedSize: MaterialStateProperty.all<Size>(Size(60, 60))),
        child: Text(
          Symbol,
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w400, color: Colors.white),
        ));
  }
}
