import 'package:emi_calc/class_attempt/widgets/chart.dart';
import 'package:emi_calc/class_attempt/widgets/my_slider.dart';

import '/class_attempt/widgets/TextBox.dart';
import 'package:flutter/material.dart';

class emi_calc_class extends StatefulWidget {
  const emi_calc_class({Key? key}) : super(key: key);

  @override
  State<emi_calc_class> createState() => _emi_calc_classState();
}

class _emi_calc_classState extends State<emi_calc_class> {
  int _value = 1; //it's scope is within this dart file
  double total_interest = 0;
  int loanAmount = 0;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  double emi = 0.0;

  // TakeSliderValue(int value) {
  //   _value = value; // scope increase
  //   print("the value of tennure is $_value");
  //   t3.text = _value.toString();
  //   setState(() {});
  // }
  TakeSliderValue(var value) {
    // Type type = value.runtimeType;
    _value = value.toInt(); // scope increase
    print("the value of tennure is $_value");
    if (value.runtimeType == double) {
      t3.text = value.toInt().toString();
    }
    setState(() {});
  }

  _compute() {
    loanAmount = int.parse(t1.text);
    int roi = int.parse(t2.text);
    int tenure = int.parse(t3.text);
    total_interest =
        double.parse((loanAmount * roi * tenure / 100).toStringAsFixed(2));
    emi = double.parse(
        ((total_interest + loanAmount) / (12 * tenure)).toStringAsFixed(2));
    setState(() {});
  }

  _getTextContainer(label, value, devicesize) {
    return Container(
      height: 45,
      width: devicesize.width / 2.2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: TextStyle(fontSize: 16)),
          Text("₹ $value")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    Map<String, double> dataMap = {
      "Interest": total_interest,
      "Principal Amount": loanAmount.toDouble()
    };
    // TextBox tb = TextBox(label: 'Tenure', icon: Icons.timelapse, tc: t3,fn: TakeSliderValue,);
    // tb.setFunction(TakeSliderValue);
    return Scaffold(
      appBar: AppBar(
        title: Text("EMI Calculator"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextBox(
              label: 'Loan Amount',
              icon: Icons.attach_money,
              tc: t1,
            ),
            TextBox(label: 'ROI', icon: Icons.attach_money, tc: t2),
            TextBox(
              label: 'Tenure',
              icon: Icons.timelapse,
              tc: t3,
              fn: TakeSliderValue,
            ),
            my_slider(TakeSliderValue,
                _value), //pass Fn as an argument to the constructor
            ElevatedButton(
                style: ButtonStyle(
                    //backgroundColor: MaterialStateProperty
                    ),
                onPressed: _compute,
                // other option
                // onPresses: (){
                // _compute();
                // }
                child: Text("Compute")),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                  child: Row(
                children: [
                  Container(
                    child: Expanded(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              _getTextContainer("Loan EMI", emi, deviceSize),
                              SizedBox(
                                height: 10,
                              ),
                              _getTextContainer("Total Interest Playable",
                                  total_interest, deviceSize),
                              SizedBox(
                                height: 10,
                              ),
                              _getTextContainer("Total Payment",
                                  loanAmount + total_interest, deviceSize)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: chart(dataMap),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
