import 'package:flutter/material.dart';

class MyListTiles extends StatelessWidget {
  final String iconPath;
  final String tileTitle;
  final String tileSubTitle;
  const MyListTiles(
      {Key? key,
      required this.iconPath,
      required this.tileSubTitle,
      required this.tileTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            //icon
            Container(
              padding: const EdgeInsets.all(12),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(iconPath),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tileTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  tileSubTitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        const Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
