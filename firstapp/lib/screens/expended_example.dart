import 'package:flutter/material.dart';

class expendedwidget extends StatelessWidget {
  const expendedwidget({ Key? key }) : super(key: key);

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
                      Expanded(child: Text("Total Amount")),
                      Text("50000")
                    ],
                  )
                ],
              ),
            ),
      
    );
  }
}