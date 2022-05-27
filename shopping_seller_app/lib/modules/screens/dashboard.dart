import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import 'package:shopping_seller_app/modules/Services/drawer_options_list.dart';
import 'package:shopping_seller_app/modules/repository/user_repo.dart';
import 'package:shopping_seller_app/modules/widgets/drawer.dart';

import '../models/drawer_option.dart';

class Dashboard extends StatelessWidget {
  UserRepository repo = UserRepository();
  DrawerOptionList list = DrawerOptionList();
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        child: Column(
          children: [
            Container(
              child: StreamBuilder(
                  stream: repo.readRealTime(),
                  builder: ((BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text(Messages.ERROR);
                    } else {
                      return Text("Total Users : ${snapshot.data!.docs.length}");
                    }
                  })
              ),
            ),
            // Container(
            //   child: FutureBuilder(
            //     future: ,
            //     builder: (context, snapshot) {
                
            //     }
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
