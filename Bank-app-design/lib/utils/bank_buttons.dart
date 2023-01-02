import 'package:flutter/material.dart';

class MyBankButtons extends StatelessWidget {
  final String logo, bankName, bank;
  const MyBankButtons(
      {Key? key,
      required this.logo,
      required this.bankName,
      required this.bank})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Citi bank button
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
          height: 85,
          child: Image.asset(logo),
        ),
        const SizedBox(
          height: 8,
        ),
        //Citi bank text
        Text(
          bankName,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        Text(
          bank,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.grey),
        ),

        // PNC bank

        //Bank of america button
      ],
    );
  }
}
