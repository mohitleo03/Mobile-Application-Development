import 'package:flutter/material.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import 'package:shopping_seller_app/config/routes/routes.dart';
import 'package:shopping_seller_app/core/auth/login/screens/login.dart';
import 'package:shopping_seller_app/core/auth/register/screens/register.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    // home: Login(),
    // home: Register(),  //once initial route defined no need to mention home
    initialRoute: RouteConstants.LOGIN,  //inital or base route
    routes: getRoutes(), //all routes are loaded here
  ));
}
