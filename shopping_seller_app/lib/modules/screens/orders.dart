import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/Services/dashboard_services.dart';
import 'package:shopping_seller_app/modules/repository/orders_repo.dart';
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
  DrawerOptionList list = DrawerOptionList();
  DashboardServices service = DashboardServices();

  dynamic dropdownValue = "ALL";

  List<DropdownMenuItem<String>> item_list = [
    DropdownMenuItem(child: Text("PENDING"), value: "PENDING"),
    DropdownMenuItem(child: Text("DELIVERED"), value: "DELIVERED"),
    DropdownMenuItem(child: Text("CANCELLED"), value: "CANCELLED"),
    DropdownMenuItem(child: Text("ALL"), value: "ALL")
  ];

  @override
  Widget build(BuildContext context) {
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
                return Text("Some error has occured");
              } else {
                List<Order> list = service.convertOrders(snapshot);

                return Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        if (list[index].order_status == dropdownValue) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(8, 20, 8, 10),
                            child: Container(
                                alignment: Alignment.center,
                                height: 150,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.blue[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                          offset: Offset(5, 10))
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                          "Order ID : ${list[index].id}",
                                          style: GoogleFonts.lato(
                                              fontSize: 23,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    FittedBox(
                                      child: Text(
                                        "Product ID : " +
                                            "${list[index].products_list[0]['product_id']}",
                                        style: GoogleFonts.lato(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),
                                    Text("Price : " + "${list[index].price}",
                                        style: GoogleFonts.lato(
                                            fontSize: 20, color: Colors.black)),
                                    Text(
                                        "Status : " +
                                            "${list[index].order_status}",
                                        style: GoogleFonts.lato(
                                            fontSize: 20, color: Colors.black)),
                                    Text(
                                        "Zone : " +
                                            "${list[index].delivery_zone}",
                                        style: GoogleFonts.lato(
                                            fontSize: 20, color: Colors.black))
                                  ],
                                )),
                          );
                        } else if (dropdownValue == "ALL") {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
                            child: Container(
                                alignment: Alignment.center,
                                height: 150,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.blue[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                          offset: Offset(5, 10))
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                          "Order ID : ${list[index].id}",
                                          style: GoogleFonts.lato(
                                              fontSize: 23,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    FittedBox(
                                      child: Text(
                                        "Product ID : " +
                                            "${list[index].products_list[0]['product_id']}",
                                        style: GoogleFonts.lato(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),
                                    Text("Price : " + "${list[index].price}",
                                        style: GoogleFonts.lato(
                                            fontSize: 20, color: Colors.black)),
                                    Text(
                                        "Status : " +
                                            "${list[index].order_status}",
                                        style: GoogleFonts.lato(
                                            fontSize: 20, color: Colors.black)),
                                    Text(
                                        "Zone : " +
                                            "${list[index].delivery_zone}",
                                        style: GoogleFonts.lato(
                                            fontSize: 20, color: Colors.black))
                                  ],
                                )),
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
