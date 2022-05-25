import 'package:flutter/material.dart';

class pageView extends StatelessWidget {
  const pageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: PageView(
        scrollDirection:
            Axis.vertical, // Use [Axis.vertical] to scroll vertically.
        // [PageView.scrollDirection] defaults to [Axis.horizontal].
        controller: controller,
        children: const <Widget>[
          Center(
            child: Text('First Page'),
          ),
          Center(
            child: Text('Second Page'),
          ),
          Center(
            child: Text('Third Page'),
          )
        ],
      ),
    );
  }
}
