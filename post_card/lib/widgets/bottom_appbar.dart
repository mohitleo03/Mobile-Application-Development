import 'package:flutter/material.dart';

import '../constants.dart';

class BottomAppbar extends StatelessWidget {
  const BottomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: pink,
      elevation: 0,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home_rounded, size: 30),
            Icon(Icons.email_rounded, size: 30),
            SizedBox(width: 10),
            Icon(Icons.notifications, size: 30),
            Icon(Icons.person_rounded, size: 30),
          ],
        ),
      ),
    );
  }
}
