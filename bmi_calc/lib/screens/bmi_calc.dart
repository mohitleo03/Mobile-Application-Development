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
  String ButtonText = "CALCULATE";
  String _gender = "";
  int _height = 160;
  int _weight = 60;
  int _age = 24;
  double _bmi = 0;

  getGender(String value) {
    _gender = value;
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
      body: Container(
        height: deviceSize.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: deviceSize.height / 4.3,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 13, 0, 9),
                      child: genderButton(
                          Icons.male, "MALE", deviceSize, getGender),
                    )),
                    SizedBox(width: deviceSize.width / 25),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 13, 12, 9),
                      child: genderButton(
                          Icons.female, "FEMALE", deviceSize, getGender),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 6, 10, 5),
                child: Container(
                  height: deviceSize.height / 4.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 29, 30, 51),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: Text(
                              "HEIGHT",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text("$_height",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: deviceSize.height / 11,
                                      fontWeight: FontWeight.w900)),
                              Text("cm",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: deviceSize.height / 35)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child:
                                mySlider(deviceSize, _height, TaskeSliderValue),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: deviceSize.height / 3.2,
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
                    fixedSize: Size(deviceSize.width, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
