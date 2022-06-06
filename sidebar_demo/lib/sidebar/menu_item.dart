import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SidebarMenuItem extends StatelessWidget {
  IconData icon;
  String title;
  Function onTap;
  SidebarMenuItem(
      {required this.icon, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tapped on $title");
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.cyan,
              size: 30,
            ),
            SizedBox(width: 20),
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 26,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}
