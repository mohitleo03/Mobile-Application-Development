import 'package:flutter/material.dart';

class mySlider extends StatelessWidget {
  Size deviceSize;
  int height;
  Function fn;
  mySlider(this.deviceSize, this.height, this.fn);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceSize.width - 20,
      child: Slider(
        onChanged: (double value) {
          fn(value.toInt());
        },
        value: height.toDouble(),
        min: 55,
        max: 190,
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        thumbColor: Color.fromARGB(255, 235, 21, 85),
      ),
    );
  }
}
