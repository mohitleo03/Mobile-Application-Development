import 'package:flutter/material.dart';

class my_slider extends StatelessWidget {
  int value;
  Function Fn;
  my_slider(this.Fn,this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        value: value.toDouble(), //current value
        min: 1,
        max: 20,
        onChanged: (double value) {
          Fn(value);
        },
      ),
    );
  }
}
