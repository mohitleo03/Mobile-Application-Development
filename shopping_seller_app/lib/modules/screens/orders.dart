import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_seller_app/modules/Services/services.dart';
import 'package:shopping_seller_app/modules/models/product.dart';
import 'package:shopping_seller_app/modules/repository/orders_repo.dart';
import 'package:shopping_seller_app/modules/repository/product_repo.dart';
import 'package:shopping_seller_app/modules/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/AppConstants.dart';
import '../Services/drawer_options_list.dart';
import '../models/drawer_option.dart';
import '../models/orders.dart';

class Orders extends StatefulWidget {
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  OrdersRepo ordersRepo = OrdersRepo.getInstance();
  ProductRepository productRepo = ProductRepository();
  DrawerOptionList list = DrawerOptionList();
  Services service = Services();

  String dropdownValue = "ALL";
  List<Order?> _getOrdersList(List<Order?> list) {
    list = list.map((order) {
      if (order!.order_status == dropdownValue) {
        return order;
      }
    }).toList();
    return list;
  }

  List<DropdownMenuItem<String>> item_list = [
    DropdownMenuItem(
        child: Text(OrderStatus.PENDING), value: OrderStatus.PENDING),
    DropdownMenuItem(
        child: Text(OrderStatus.DELIVERED), value: OrderStatus.DELIVERED),
    DropdownMenuItem(
        child: Text(OrderStatus.CANCELLED), value: OrderStatus.CANCELLED),
    DropdownMenuItem(child: Text(OrderStatus.ALL), value: OrderStatus.ALL)
  ];

  List<Widget> _getProducts(Order order) {
    List<Widget> products = order.products_list
        .map((product) => Container(
              child: Column(
                children: [
                  FutureBuilder(
                      future:
                          productRepo.getSingleProduct(product['product_id']),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(Messages.ERROR),
                          );
                        } else {
                          var temp = snapshot.data["name"];
                          print("Run time type is ${temp}}");
                          
                          return Container(
                            child: Row(
                              children: [
                                Column(
                                  children: [Text("Got Data")],
                                )
                              ],
                            ),
                          );
                        }
                      })
                ],
              ),
            ))
        .toList();
    return products;
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    List<DrawerOption> drawer_options_list = list.drawer_options;
    drawer_options_list = drawer_options_list.map((drawerOption) {
      if (drawerOption.name == AppBarTitle.ORDERS) {
        drawerOption.isActive = true;
        return drawerOption;
      } else {
        return drawerOption;
      }
    }).toList();
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String userid = arguments['userid'];
    return Scaffold(
      appBar: AppBar(
        title: Text(AppBarTitle.ORDERS),
      ),
      drawer: Drawer(child: myDrawer(userid, drawer_options_list)),
      body: Center(
        child: Column(children: [
          DropdownButton(
              items: item_list,
              onChanged: (dynamic newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              value: dropdownValue),
          FutureBuilder(
            future: ordersRepo.getOrders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text(Messages.ERROR);
              } else {
                List<Order> list = service.convertOrders(snapshot);
                _getOrdersList(list);
                return Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        if (list.isNotEmpty) {
                          return Container(
                            height: deviceSize.height - 100,
                            child: ListView.builder(
                                itemCount: list.length,
                                itemBuilder: ((context, index) {
                                  return Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(list[index].order_status),
                                        ),
                                        Divider(height: 1),
                                        Container(
                                          child: Column(
                                            children: _getProducts(list[index]),
                                          ),
                                        ),
                                        Divider(height: 1),
                                        Container(
                                          child: Text(
                                              "Amount : ${list[index].price}"),
                                        )
                                      ],
                                    ),
                                  );
                                })),
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      }),
                );
              }
            },
          )
        ]),
      ),
    );
  }
}
