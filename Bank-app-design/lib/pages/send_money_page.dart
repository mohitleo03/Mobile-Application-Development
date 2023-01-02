import 'package:dashboard_design/utils/bottom_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/bank_buttons.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              //Nav buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  //Back button
                  Icon(Icons.arrow_back),

                  //Menu button
                  Icon(Icons.menu),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //Banner Text => Send money, Add money to your bank account
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Send ',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Money',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    'Add your bank account',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              //Why to add account container
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(bottom: 15.0),
                            child: Text(
                              'Why to add bank account?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Text(
                            'Without adding your bank account, you are not able send money',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 5,
                      ),
                      height: 100,
                      width: 95,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFCACA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'images/woman.png',
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              //Bank Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  //citi bank
                  MyBankButtons(
                      logo: 'images/citibank_logo.png',
                      bankName: 'Citi',
                      bank: 'Bank'),
                  MyBankButtons(
                      logo: 'images/pnc_logo.png',
                      bankName: 'PNC',
                      bank: 'Bank'),
                  MyBankButtons(
                      logo: 'images/hsbc.png',
                      bankName: 'Bank of',
                      bank: 'America'),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const BottomContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
