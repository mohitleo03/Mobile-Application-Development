import 'dart:math';

import 'package:bmi_calc/widgets/genderButton.dart';
import 'package:bmi_calc/widgets/mySlider.dart';
import 'package:bmi_calc/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class bmi_calc extends StatefulWidget {
  @override
  State<bmi_calc> createState() => _bmi_calcState();
}

class _bmi_calcState extends State<bmi_calc> {
  Color Text_color = Color.fromARGB(171, 165, 167, 190);
  int gender_button_pressed =0; //0 - non selected, 1 - male selected, 2 - female selected
  String ButtonText = "CALCULATE";
  String _gender = "";
  int _height = 160;
  int _weight = 60;
  int _age = 24;
  double _bmi = 0;

  getGender(String value) {
    _gender = value;
    if (_gender == "MALE") gender_button_pressed = 1;
    if (_gender == "FEMALE") gender_button_pressed = 2;
    ButtonText = "CALCULATE";
    setState(() {});
  }

  TaskeSliderValue(int value) {
    _height = value;
    ButtonText = "CALCULATE";
    setState(() {});
  }

  changeWeight(int value) {
    _weight += value;
    ButtonText = "CALCULATE";
    setState(() {});
  }

  changeAge(int value) {
    _age += value;
    ButtonText = "CALCULATE";
    setState(() {});
  }

  _calculate() {
    _bmi = _weight / pow((_height / 100), 2);
    _bmi = double.parse(_bmi.toStringAsFixed(2));
    ButtonText = "Your BMI is $_bmi";
    //calculate bmi
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 14, 33),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 10, 14, 33)),
        backgroundColor: Color.fromARGB(255, 10, 14, 33),
        title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 11,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 13, 0, 9),
                  child: genderButton(Icons.male, "MALE", deviceSize,
                      getGender, gender_button_pressed),
                )),
                SizedBox(width: deviceSize.width / 25),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 13, 12, 9),
                  child: genderButton(Icons.female, "FEMALE", deviceSize,
                      getGender, gender_button_pressed),
                ))
              ],
            ),
          ),
          Expanded(
            flex: 13,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 6, 10, 5),
              child: Container(
                decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 29, 30, 51),
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 4),
                        Text(
                          "HEIGHT",
                          style: TextStyle(
                              color: Color.fromARGB(171, 165, 167, 190),
                              fontSize: 18),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("$_height",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: deviceSize.height / 12.4,
                                    fontWeight: FontWeight.w900)),
                            Text("cm",
                                style: TextStyle(
                                    color: Text_color,
                                    fontSize: deviceSize.height / 35)),
                          ],
                        ),
                        mySlider(deviceSize, _height, TaskeSliderValue),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          Expanded(
            flex: 14,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 11, 0, 12),
                  child:
                      my_card("WEIGHT", _weight, deviceSize, changeWeight),
                )),
                SizedBox(width: deviceSize.width / 25),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 11, 12, 12),
                  child: my_card("AGE", _age, deviceSize, changeAge),
                ))
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _calculate,
            child: Text(ButtonText,
                style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 235, 21, 85),
                fixedSize: Size(deviceSize.width, 50)
                ),
          ),
        ],
      ),
    );
  }
}
