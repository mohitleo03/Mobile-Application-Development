import 'package:dashboard_design/utils/bank_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
            color: Colors.grey[100],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: const [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Select your Bank',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BankListing(
                bankLogo: 'images/citibank_logo.png',
                bankName: 'Citi Bank',
                cardNumber: '**** 3256 8790',
              ),
              SizedBox(
                height: 15,
              ),
              BankListing(
                bankLogo: 'images/hsbc.png',
                bankName: 'Bank of America',
                cardNumber: '**** 8877 8790',
              ),
              SizedBox(
                height: 15,
              ),
              BankListing(
                bankLogo: 'images/pnc_logo.png',
                bankName: 'PNC Bank',
                cardNumber: '**** 2000 8340',
              ),
              SizedBox(
                height: 15,
              ),
              BankListing(
                bankLogo: 'images/pnc_logo.png',
                bankName: 'PNC Bank',
                cardNumber: '**** 2000 8340',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
