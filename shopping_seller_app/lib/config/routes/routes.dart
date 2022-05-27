//all application routes are placed here
//Routes - Navigation
import 'package:flutter/material.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import 'package:shopping_seller_app/modules/screens/dashboard.dart';
import 'package:shopping_seller_app/modules/screens/manage_products.dart';
import 'package:shopping_seller_app/modules/screens/orders.dart';
import 'package:shopping_seller_app/modules/screens/register_delivery_boy.dart';

import '../../core/auth/screens/login.dart';
import '../../core/auth/screens/register.dart';

Map<String,WidgetBuilder>getRoutes() {
  return {
    RouteConstants.LOGIN:(context) => const Login(),
    RouteConstants.REGISTER:(context) => const Register(),
    RouteConstants.DASHBOARD:(context) =>  Dashboard(),
    RouteConstants.MANAGE_PRODUCTS:(context) => manageProducts(),
    RouteConstants.ORDERS:(context) => Orders(),
    RouteConstants.REGISTER_DELIVERY_BOY:(context) => RegisterDeliveryBoy()
  };
}