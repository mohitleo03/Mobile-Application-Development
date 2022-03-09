import 'package:flutter/material.dart';

class columns extends StatelessWidget {
  _getContainer(Color color, {double width = 50, double height = 50}) {
    return Container(
      color: color,
      height: height,
      width: width,
    );
  }

  _getText(String txt, {double fontSize = 16}) {
    return Text(txt, style: TextStyle(fontSize: fontSize));
  }

 _getImages(String url , {int flex = 1}) {
    return Expanded(child: Image.network(url),flex: flex,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //by default it is from start
          crossAxisAlignment: CrossAxisAlignment.end,

          //mainAxisSize: MainAxisSize.min, //by default it is max
          children: [
            // _getContainer(Colors.red),
            // _getContainer(Colors.green, height: 100, width: 100),
            // _getContainer(Colors.blue)
            // _getText("hi"),
            // _getText("hello",fontSize: 30),
            // _getText("hola"),
             _getImages('https://imgd.aeplcdn.com/0x0/n/cw/ec/52639/3-series-gran-limousine-exterior-right-front-three-quarter-2.jpeg'),
              _getImages('https://i.ytimg.com/vi/fjsy309KJ1Q/maxresdefault.jpg',flex: 3),
              _getImages('https://www.bmw-deutschemotoren.in/sites/default/files/2022-01/500x542_0.jpg',flex: 2),
          ],
        ),
      ),
    );
  }
}
