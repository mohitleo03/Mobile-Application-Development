import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final iconImagePath;
  final String buttonText;

  const MyButtons(
      {Key? key, required this.buttonText, required this.iconImagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //send button
        Column(
          children: [
            Container(
              height: 90,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
                // color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Image.asset(iconImagePath),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              buttonText,
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
        //pay button

        //bill button
      ],
    );
  }
}
