import 'package:flutter/material.dart';

class textBox extends StatefulWidget {
  textBox() {}

  @override
  State<textBox> createState() => _textBoxState();
}

class _textBoxState extends State<textBox> {
  late int _count;
  String val = "";

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
              //Event based approach to get changes in text box
              
              onChanged: (String value) {
                val = value;
                setState(() {

                });
                print(val);
              },
              keyboardType: TextInputType.number,
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_plus()},
        child: Text("+"),
      ),
    );
  }
}
