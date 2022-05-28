import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import 'package:shopping_seller_app/modules/Services/dashboard_services.dart';
import 'package:shopping_seller_app/modules/Services/drawer_options_list.dart';
import 'package:shopping_seller_app/modules/repository/orders_repo.dart';
import 'package:shopping_seller_app/modules/repository/user_repo.dart';
import 'package:shopping_seller_app/modules/widgets/drawer.dart';
import 'package:shopping_seller_app/modules/widgets/graph.dart';
import 'package:shopping_seller_app/modules/widgets/pie_cart.dart';
import '../models/drawer_option.dart';

class Dashboard extends StatelessWidget {
  OrdersRepo orderRepo = OrdersRepo.getInstance();
  UserRepository userRepo = UserRepository();
  DashboardServices service = DashboardServices();
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
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text(Messages.ERROR);
                      } else {
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                              "Total Users : ${snapshot.data!.docs.length}"),
                        );
                      }
                    })),
              ),
              Container(
                child: FutureBuilder(
                    future: orderRepo.getOrders(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text(Messages.ERROR);
                      } else {
                        service.converetOrders(snapshot);

                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(20),
                              child: pie_chart(
                                  service.getOrdersCountByStatus(), "Orders"),
                            ),
                            Container(
                              child: myGraph(service.getSalesData()),
                            )
                          ],
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
