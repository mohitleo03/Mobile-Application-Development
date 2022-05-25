import 'package:firstapp/screens/scaff.dart';
import 'package:flutter/material.dart';

class fittedBoxExample extends StatelessWidget {
  const fittedBoxExample({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FittedBox(
        child: Row(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("Button")),
            ElevatedButton(onPressed: (){}, child: Text("Button")),
            ElevatedButton(onPressed: (){}, child: Text("Button")),
            ElevatedButton(onPressed: (){}, child: Text("Button")),
            ElevatedButton(onPressed: (){}, child: Text("Button")),
            ElevatedButton(onPressed: (){}, child: Text("Button")),
            ElevatedButton(onPressed: (){}, child: Text("Button")),
            ElevatedButton(onPressed: (){}, child: Text("Button")),
            ElevatedButton(onPressed: (){}, child: Text("Button")),
          ],
        ),
      ),
    );
  }
}