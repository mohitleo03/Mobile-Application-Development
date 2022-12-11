import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'SecondScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
      navigateRoute: SecondScreen(),
      duration: 1800,
      imageSize: 180,
      imageSrc: "images/yourbooks_logo_only.jpg",
      text: "YourBooks",
      textType: TextType.NormalText,
      textStyle:
          TextStyle(fontSize: 40.0, color: Color.fromARGB(255, 14, 59, 99)),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash screen Demo',
      home: example1,
    );
  }
}
