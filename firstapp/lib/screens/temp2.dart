import 'package:flutter/material.dart';

class temp2 extends StatefulWidget {
  const temp2({ Key? key }) : super(key: key);

  @override
  State<temp2> createState() => _temp2State();
}

class _temp2State extends State<temp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(100, 1, 1, 1),
        backgroundColor: Colors.white.withOpacity(0.3),
        elevation: 0,
      ),
      body: ListView.builder(itemBuilder: (context,index )=>Container(
        margin: EdgeInsets.only(top: 5,bottom: 5),
        height: 200,
        width: double.infinity,
        color: Colors.green,
      )),
    );
  }
}