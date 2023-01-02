import 'package:bubble_loader/bubble_loader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bubble Loader Example App'),
          centerTitle: true,
        ),
        body: loading ? const BubbleLoader(
          color1: Colors.deepPurple,
          color2: Colors.deepOrange,
          bubbleGap: 10,
          bubbleScalingFactor: 1,
          duration: Duration(milliseconds: 1500),) :
        Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
            const Text('Hello Flutter Devs',style: TextStyle(fontSize: 25),),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: showBubbleLoader,
            child: const Text('Press to see Bubble Loader'),
          ),
          ],
        ),),
    ));
  }

  Future<void> showBubbleLoader() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      loading = false;
    });
  }
}