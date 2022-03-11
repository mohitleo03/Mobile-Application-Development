import 'package:bmi_calc/widgets/genderButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class bmi_calc extends StatefulWidget {
  @override
  State<bmi_calc> createState() => _bmi_calcState();
}

class _bmi_calcState extends State<bmi_calc> {
  int _height = 0;
  _calculate() {
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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: genderButton(Icons.male, "MALE")),
                Expanded(child: genderButton(Icons.female, "FEMALE"))
              ],
            ),
            Container(
              color: Color.fromARGB(255, 29, 30, 51),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text("$_height",
                        style: TextStyle(color: Colors.white, fontSize: 50,fontWeight: FontWeight.w900))
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [],
            ),
            ElevatedButton(
              onPressed: _calculate,
              child: Text("CALCULATE",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 235, 21, 85),
                  fixedSize: Size(deviceSize.width, 70)),
            ),
          ],
        ),
      ),
    );
  }
}
