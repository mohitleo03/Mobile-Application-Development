//all application routes are placed here
//Routes - Navigation
import 'package:flutter/material.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import 'package:shopping_seller_app/modules/screens/dashboard.dart';
import 'package:shopping_seller_app/my_attempt/view_prod.dart';

import '../../core/auth/screens/login.dart';
import '../../core/auth/screens/register.dart';

Map<String,WidgetBuilder>getRoutes() {
  return {
    RouteConstants.LOGIN:(context) => const Login(),
    //when 
    RouteConstants.REGISTER:(context) => const Register(),
    RouteConstants.DASHBOARD:(context) => const Dashboard(),
    RouteConstants.VIEW_PRODUCTS:(context) => const view_products()
  };
}