import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class bmi_calc extends StatefulWidget {
  @override
  State<bmi_calc> createState() => _bmi_calcState();
}

class _bmi_calcState extends State<bmi_calc> {
  _calculate() {
    //calculate bmi
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 10, 14, 33)),
        backgroundColor: Color.fromARGB(255, 10, 14, 33),
        title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [],
            ),
            Row(
              children: [
                Column(
                  children: [],
                )
              ],
            ),
            Row(
              children: [],
            ),
            ElevatedButton(onPressed: _calculate, child: Text("CALCULATE"))
          ],
        ),
      ),
    );
  }
}
