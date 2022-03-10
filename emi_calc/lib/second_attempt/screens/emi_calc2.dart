import 'package:flutter/material.dart';

class emi_calc2 extends StatefulWidget {
  const emi_calc2({Key? key}) : super(key: key);

  @override
  State<emi_calc2> createState() => _emi_calc2State();
}

class _emi_calc2State extends State<emi_calc2> {
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();
  double _tenure = 1;
  double _amount = 1;
  double _interest_rate = 1;
  double _interest = 0;

  calc_emi() {
    _amount = double.parse(tc1.text);
    _interest_rate = double.parse(tc2.text);
    _interest = (_amount * _interest_rate * _tenure) / 100;
    setState(() {});
    print("interest to be paid is $_interest");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('EMI CALCULATOR')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: tc1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                helperText: 'in Rupees',
                label: const Text(
                  'Amount',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: tc2,
              onChanged: (String value) {
                _interest_rate = double.parse(value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                helperText: 'in %',
                label: const Text(
                  'Interest',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const Text('Enter Tenure'),
            Slider(
              min: 1,
              max: 20,
              value: _tenure,
              onChanged: (double value) {
                _tenure = value;
                setState(() {});
              },
            ),
            Text("Years selected - $_tenure"),
            FlatButton(
                color: Colors.black,
                onPressed: calc_emi(),
                child: Text(
                    "Get EMI")), //without pressing calc_emi how it's being called??
            Text("Total Interest to be paid is $_interest")
          ],
        ),
      ),
    );
  }
}
