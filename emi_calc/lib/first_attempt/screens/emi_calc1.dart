import 'package:flutter/material.dart';

class emi_calc extends StatefulWidget {
  const emi_calc({Key? key}) : super(key: key);

  @override
  State<emi_calc> createState() => _emi_calcState();
}

class _emi_calcState extends State<emi_calc> {
  double _tenure = 1;
  double _amount = 0;
  double _interest_rate = 0;
  double _interest = 0;

  show_interest() {
    calc_emi();
  }

  calc_emi() {
    _interest = (_amount * _interest_rate * _tenure) / 100;
    setState(() {});
    print("interest to be paid is $_interest");
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _tenure = 1;
  //   _amount = 0;
  //   _interest_rate = 0;
  //   _interest = 0;
  // }

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
              onChanged: (String value) {
                print("The value of amount is $value");
                _amount = double.parse(value);
              },
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
                calc_emi();
              //   setState(() {});
                
               },
            ),
            Text("Years selected - $_tenure"),
            // FlatButton(
            //     color: Colors.black,
            //     onPressed: show_interest(),
            //     child: Text(
            //         "Get EMI")), //without pressing calc_emi how it's being called??
            Text("Total Interest to be paid is $_interest")
          ],
        ),
      ),
    );
  }
}
