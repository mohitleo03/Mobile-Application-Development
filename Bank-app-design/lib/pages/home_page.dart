import 'package:dashboard_design/utils/list_tiles.dart';
import 'package:dashboard_design/utils/my_cards.dart';
import 'package:dashboard_design/utils/transaction_buttons.dart';
import 'package:flutter/material.dart';
import 'send_money_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int i = 0;
    MoveCarousel() {
      Future.delayed(Duration(seconds: 3), () {
        i++;
        _controller.animateToPage(i % 3,
            duration: const Duration(seconds: 1), curve: Curves.easeOutCirc);
        MoveCarousel();
      });
    }
    MoveCarousel();
  }

  //pageController
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.monetization_on),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SendMoney()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    size: 40,
                    color: Colors.blue,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: 40,
                    color: Colors.blue,
                  )),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //   app bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'My ',
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Cards',
                            style: TextStyle(
                              fontSize: 26.0,
                            ),
                          ),
                        ],
                      ),
                      //add icon
                      Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[400], shape: BoxShape.circle),
                          child: const Icon(Icons.add)),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),
              // cards
              SizedBox(
                  height: 200,
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      MyCards(
                        balance: 2.34509,
                        cardNumber: 123456789,
                        expiryMonth: 12,
                        expiryYear: 12,
                        color: Colors.deepPurple,
                      ),
                      MyCards(
                        balance: 45.34509,
                        cardNumber: 05836825,
                        expiryMonth: 02,
                        expiryYear: 05,
                        color: Colors.blueAccent,
                      ),
                      MyCards(
                        balance: 6.022509,
                        cardNumber: 16283789,
                        expiryMonth: 14,
                        expiryYear: 11,
                        color: Colors.deepOrange,
                      ),
                    ],
                  )),
              const SizedBox(height: 20.0),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.grey.shade800,
                ),
              ),
              //   3 buttons => send + pay + bills
              const SizedBox(height: 40.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    //send button
                    MyButtons(
                      buttonText: 'Send',
                      iconImagePath: 'images/send_money.png',
                    ),
                    // pay button
                    MyButtons(
                      buttonText: 'Pay',
                      iconImagePath: 'images/credit_card.png',
                    ),
                    // bills button
                    MyButtons(
                      buttonText: 'Bill',
                      iconImagePath: 'images/bill.png',
                    ),
                  ],
                ),
              ),
              // column => stats + transaction
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: const [
                    // statistics history
                    MyListTiles(
                        iconPath: 'images/statistics.png',
                        tileSubTitle: 'Payment and Statistics',
                        tileTitle: 'Statistics'),

                    // transaction history
                    SizedBox(
                      height: 20,
                    ),
                    MyListTiles(
                        iconPath: 'images/transaction.png',
                        tileSubTitle: 'Transaction History',
                        tileTitle: 'Transaction'),
                    SizedBox(
                      height: 20,
                    ),
                    MyListTiles(
                        iconPath: 'images/bank_statement.png',
                        tileSubTitle: 'All transactions',
                        tileTitle: 'Bank statement'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
