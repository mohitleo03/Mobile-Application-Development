import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import 'package:shopping_seller_app/modules/Services/services.dart';
import 'package:shopping_seller_app/modules/Services/drawer_options_list.dart';
import 'package:shopping_seller_app/modules/repository/orders_repo.dart';
import 'package:shopping_seller_app/modules/repository/product_repo.dart';
import 'package:shopping_seller_app/modules/repository/user_repo.dart';
import 'package:shopping_seller_app/modules/widgets/drawer.dart';
import 'package:shopping_seller_app/modules/widgets/graph.dart';
import 'package:shopping_seller_app/modules/widgets/pie_cart.dart';
import '../models/drawer_option.dart';
import '../models/product.dart';

class Dashboard extends StatelessWidget {
  List<Color> order_status_colors = [Colors.purple,Colors.deepPurpleAccent,Color.fromARGB(255, 76, 41, 133)];
  List<Color> categories_colors = [Colors.purple,Colors.indigo,Colors.green,Colors.yellow,Colors.orange,Colors.red];
  OrdersRepo orderRepo = OrdersRepo.getInstance();
  ProductRepository productRepo = ProductRepository();
  UserRepository userRepo = UserRepository();
  Services service = Services();
  DrawerOptionList list = DrawerOptionList();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    List<DrawerOption> drawer_options_list = list.drawer_options;
    drawer_options_list = drawer_options_list.map((drawerOption) {
      if (drawerOption.name == AppBarTitle.DASHBOARD) {
        drawerOption.isActive = true;
        return drawerOption;
      } else {
        
        return drawerOption;
      }
    }).toList();
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String userid = arguments['userid'];
    // String arguments = ModalRoute.of(context)!.settings.arguments as String; // we can also use any other data type but map is standard form of sending data becuas ewe just have to call the key we don't have to remember the index of data member
    // String userid = arguments;
    return Scaffold(
      appBar: AppBar(title: Text(AppBarTitle.DASHBOARD)),
      drawer: Drawer(child: myDrawer(userid, drawer_options_list)),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: StreamBuilder(
                    stream: userRepo.readRealTime(),
                    builder: ((BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text(Messages.ERROR);
                      } else {
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Total Users : ${snapshot.data!.docs.length}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 41, 11, 93)),
                          ),
                        );
                      }
                    })),
              ),
              Container(
                  child: FutureBuilder(
                      future: orderRepo.getOrders(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text(Messages.ERROR);
                        } else {
                          service.convertOrders(snapshot);
                          Map<String,double> orderData = service.getOrdersCountByStatus();
                          return Column(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Order status',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.deepPurple),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: pie_chart(
                                    dataMap: orderData,
                                    title: "Orders",colors:  order_status_colors),
                                  ),
                                ],
                              ),
                              
                              Container(
                                child: Column(children: [
                                  const Text(
                                    'Sales Analysis of Last 30 days',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.deepPurple),
                                  ),
                                  // const SizedBox(
                                  //   height: 10,
                                  // ),
                                  myGraph(service.getSalesData())
                                ]),
                              ),
                              Container(
                                  child: StreamBuilder(
                                      stream: productRepo.readRealTime(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<QuerySnapshot>
                                              productsSnapshot) {
                                        if (productsSnapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else if (productsSnapshot.hasError) {
                                          return Text(Messages.ERROR);
                                        } else {
                                          List<Product> products =
                                              productsSnapshot.data!.docs
                                                  .map((doc) => Product.fromMap(
                                                      doc.data(), doc.id))
                                                  .toList();
                                          return Column(
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                child: const Text(
                                                  "Products Sold By Category",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.deepPurple),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(30),
                                                child: pie_chart(
                                                    dataMap: service
                                                        .getProductsSalesAnalysis(
                                                            products),
                                                    title: "Categories",
                                                    colors:categories_colors),
                                              ),
                                            ],
                                          );
                                        }
                                      })),
                            ],
                          );
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
