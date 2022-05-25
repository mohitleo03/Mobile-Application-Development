import 'package:flutter/material.dart';

class wrapWidgetExample extends StatelessWidget {
  const wrapWidgetExample({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(),
      body: Wrap(
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
    );
  }
}