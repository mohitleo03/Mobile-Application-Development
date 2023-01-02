import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  final double balance;
  final int cardNumber, expiryMonth, expiryYear;
  final color;
  const MyCards({
    Key? key,
    required this.balance,
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: 300.0,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            //card info
            const Text(
              'Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 10),
            Text(
              '\$$balance',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 34.0,
              ),
            ),

            const SizedBox(height: 30.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //card number
              Text(
                cardNumber.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              //Expiry date
              Text(
                '$expiryMonth/$expiryYear',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
