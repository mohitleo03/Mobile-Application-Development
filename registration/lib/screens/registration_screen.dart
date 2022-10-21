import 'package:flutter/material.dart';

class registration_screen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  //Map<String, dynamic> hobbies;
  @override
  Widget build(BuildContext context) {
    String path = "images/background.jpg";
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.dstATop),
              image: AssetImage(path))),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text("Registration Form",
                    style: TextStyle(fontSize: 35, color: Colors.white)),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 54,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 50,
                    child: Text(
                      "M",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  decoration: InputDecoration(
                    isDense: true,
                    label: Text("Name"),
                    labelStyle:
                        TextStyle(fontSize: 20, color: Colors.pink.shade300),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This is a required field';
                    }
                    if (value.length < 6) {
                      return 'Length should be more than 6';
                    }
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(value: false/*isConditionAccepted*/, onChanged: (value) {
                      
                    }),
                    Text("Accept Conditions"),
                  ],
                ),
                RawMaterialButton(
                  constraints: BoxConstraints.tightFor(
                      width: double.infinity, height: 40),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  fillColor: Colors.pink,
                  child: Text(
                    " Register ",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
