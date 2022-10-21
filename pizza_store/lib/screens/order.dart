import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_store/config/app_constants.dart';
import 'package:pizza_store/cubit/cartState.dart';
import 'package:pizza_store/repository/product_repo.dart';
import 'package:pizza_store/screens/place_order.dart';
import 'package:pizza_store/widgets/product_card.dart';

import '../cubit/cart_item_cubit.dart';
import '../models/product.dart';

class Order extends StatefulWidget {
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  ProductRepo product = ProductRepo.getInstance();
  // product.getProducts();
  List<Product> products = [];
  dynamic error;
  getProductsList(List<Product> product) {
    //this funtion is passed into songsService initialize function which will call this function when we get songs through API call & pass those songs into this function as argument to this file while calling this function
    this.products =
        product; //increase scope of songs list so that we can use it outside
    setState(() {}); //re-render so that they will be displayed
  }

  getError(dynamic error) {
    //this function is passed into songsService initialize function which will call this function on error with API call
    print("Error found in network call $error");
    setState(() {});
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  // _productList(Size deviceSize) {
  //   List<Widget> list = products.map((product) => card(product)).toList();
  //   return Container(
  //     height: deviceSize.height / 1.5,
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: list,
  //       ),
  //     ),
  //   );
  // }

  // List<Products> items = [];
  @override
  Widget build(BuildContext context) {
    int cartItems = 0; //just for initail
    double amount = 0; //just for initail
    Size deviceSize = MediaQuery.of(context).size;
    // product.getProducts(getProductsList, getError);
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        child: Column(
          children: [
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(headings.ORDER,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.info),
                                SizedBox(width: 10),
                                Icon(Icons.menu)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: BlocBuilder<CartItemCubit, cartState>(
                                builder: (ctx, state) {
                              return Text(
                                'My Cart ${state.count} ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              );
                            }),
                          ),
                          // ElevatedButton(

                          //     onPressed: () {},
                          //     child: Text("My Cart $cartItems",
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 16)),
                          //   ),
                          Container(
                            child: BlocBuilder<CartItemCubit, cartState>(
                                builder: (ctx, state) {
                              return Text(
                                '${state.price} Total',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              );
                            }),
                          )
                        ],
                      ),
                    ),

                    FutureBuilder(
                        future: product.getProducts(),
                        builder: (BuildContext ctx, AsyncSnapshot snap) {
                          ConnectionState state = snap.connectionState;
                          if (state == ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snap.hasError) {
                            return Center(
                              child: Text(headings.ERROR),
                            );
                          } else {
                            String str = snap.data.toString();
                            Map map = jsonDecode(str);
                            List<dynamic> list = map['Vegetarian'];
                            List<Product> products = list
                                .map((product) => Product.FromJSON(product))
                                .toList();
                            return Container(
                              height: 400,
                              child: ListView.builder(
                                  itemCount: products.length,
                                  itemBuilder: (BuildContext ctx, int index) {
                                    return card(products[index]);
                                  }),
                            );
                          }
                        }),
                    // products.isEmpty ? _loading() : _productList(deviceSize),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => placeOrder()));
                        },
                        child: Text("Place Order"))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
