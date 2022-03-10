import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  late String label;
  late IconData icon;
  late Function fn ;
  setFunction(fn) {
    this.fn = fn;
  }

  late TextEditingController tc;
  TextBox({
    required String label,
    required IconData icon,
    required TextEditingController tc,
  }) {
    this.label = label;
    this.tc = tc;
    this.icon = icon;
  }
  //TextBox(this.label,this.icon,this.tc);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(9),
      padding: EdgeInsets.all(9),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (String value){
          if(this.fn!=null){
            fn(int.parse(value));
          }
        },
        controller: tc,
        decoration: InputDecoration(
            suffixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Text(label),
            hintText: 'Type $label'),
      ),
    );
  }
}
