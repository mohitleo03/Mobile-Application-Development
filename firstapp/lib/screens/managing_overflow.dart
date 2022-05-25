import 'package:flutter/material.dart';

class overflow extends StatelessWidget {
  const overflow({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(child:Row(
              children: [
                Flexible(child: Text("123456789123456789123456789123456789123456789123456789",style: TextStyle(fontSize: 20))),
              ],
            )),
            // Container(
            //   width: double.infinity,
            //   height: 400,
            //   color: Colors.red,
            // ),

            // Container(
            //   width: double.infinity,
            //   height: 400,
            //   color: Colors.blue,
            // )
          ],
        ),
      ),
    );
  }
}