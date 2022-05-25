import 'package:flutter/material.dart';

class spacerwidget extends StatelessWidget {
  const spacerwidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: 
            Container(
              width: double.infinity,
              // height: 400,
              color: Colors.green,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.add),
                      Text("Total Amount"),
                      Spacer(),
                      Text("50000")
                    ],
                  )
                ],
              ),
            ),
      
    );
  }
}