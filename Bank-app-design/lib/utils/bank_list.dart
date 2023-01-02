import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BankListing extends StatelessWidget {
  final String bankLogo, bankName, cardNumber;

  const BankListing(
      {Key? key,
      required this.bankLogo,
      required this.bankName,
      required this.cardNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(20)),
            height: 70,
            child: Image.asset(
              bankLogo,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                bankName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                cardNumber,
                style: const TextStyle(
                    fontWeight: FontWeight.w900, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
      const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
      ),
    ]);
  }
}
