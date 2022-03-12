import 'package:flutter/material.dart';

class genderButton extends StatelessWidget {
  String text;
  IconData icon;
  Size deviceSize;
  Function fn;
  genderButton(this.icon, this.text, this.deviceSize,this.fn);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color.fromARGB(255, 17, 19, 40),
      onPressed: () {
        fn(text);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child:
                Icon(icon, color: Colors.white, size: deviceSize.height / 11),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 25),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
