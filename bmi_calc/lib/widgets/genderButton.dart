import 'package:flutter/material.dart';

class genderButton extends StatelessWidget {
  int gender_button_pressed;
  late Color button_color;
  late Color Text_color;
  String text;
  IconData icon;
  Size deviceSize;
  Function fn;
  genderButton(this.icon, this.text, this.deviceSize, this.fn,
      this.gender_button_pressed);
  set_button_color() {
    if (text == 'MALE' && gender_button_pressed == 1) {
      button_color = Color.fromARGB(255, 235, 21, 85);
      Text_color = Colors.white;
    } else if (text == 'FEMALE' && gender_button_pressed == 2) {
      button_color = Color.fromARGB(255, 235, 21, 85);
      Text_color = Colors.white;
    } else {
      button_color = Color.fromARGB(255, 17, 19, 39);
      Text_color = Color.fromARGB(171, 165, 167, 190);
    }
  }

  @override
  Widget build(BuildContext context) {
    set_button_color();
    return RawMaterialButton(
      fillColor: button_color,
      onPressed: () {
        fn(text);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: deviceSize.height / 11),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
                color: Text_color, fontSize: 19),
          )
        ],
      ),
    );
  }
}
