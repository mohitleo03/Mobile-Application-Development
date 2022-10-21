import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/widgets/drawer.dart';

import '../../config/constants/AppConstants.dart';
import '../Services/drawer_options_list.dart';
import '../models/drawer_option.dart';

class RegisterDeliveryBoy extends StatelessWidget {
  DrawerOptionList list = DrawerOptionList();

  @override
  Widget build(BuildContext context) {    List<DrawerOption> drawer_options_list = list.drawer_options;
    drawer_options_list = drawer_options_list.map((drawerOption) {
      if (drawerOption.name == AppBarTitle.REGISTER_DELIVERY_BOY) {
        drawerOption.isActive = true;
        return drawerOption;
      } else {
        return drawerOption;
      }
    }).toList();
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String userid = arguments['userid'];
    return Scaffold(
      appBar: AppBar(title: Text(AppBarTitle.REGISTER_DELIVERY_BOY),),
      drawer: Drawer(child: myDrawer(userid,drawer_options_list)),
      body: Center(
        child: Container(
          child: Text("Register Delivery Boy Screen"),
        ),
      ),
    );
  }
}