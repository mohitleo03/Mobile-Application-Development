import 'package:flutter/material.dart';

import '../widgets/operations.dart';
import '../widgets/output.dart';

class counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 150,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            output(),
            operations()
          ],
        ),
      ),
    );
  }
}