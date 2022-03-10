import 'package:flutter/material.dart';

class textbox_controller extends StatefulWidget {
  textbox_controller() {}

  @override
  State<textbox_controller> createState() => _textbox_controllerState();
}

class _textbox_controllerState extends State<textbox_controller> {
  late int _count;
  String val = "";
  //create an object of TextEditingController
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _count = 0;
  }

  _plus() {
    _count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Box Demo"),
      ),
      body: Column(
        children: [
          Text(
            "Count is $_count \n Value is $val",
            style: TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              //get the value in controller
              controller: tc,
              decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  prefix: Icon(Icons.person),
                  suffixIcon: Icon(
                    Icons.camera,
                    color: Colors.red,
                  ),
                  helperText: 'Name must be A-Z',
                  hintText: 'Name here',
                  label: Text("Write text here...")),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                //get the data via controller object
                val = tc.text;
                //call build to re-render it whenver changed
                setState(() {
                  
                });
              },
              child: Text("data")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_plus()},
        child: Text("+"),
      ),
    );
  }
}
