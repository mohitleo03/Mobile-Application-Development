import 'package:flutter/material.dart';
import 'package:post_card/constants.dart';
import 'package:post_card/widgets/gradient_round_border.dart';

class Appbar extends StatelessWidget with PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: black,
      elevation: 0,
      title: const Text(
        'Friend\'s Post',
        style: TextStyle(
          color: pink,
          fontSize: 30,
          fontFamily: freehand,
        ),
      ),
      actions: const [
        UnconstrainedBox(
          child: GradientBorder(
            child: Icon(Icons.add),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
