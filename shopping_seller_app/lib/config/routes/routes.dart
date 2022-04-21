//all application routes are placed here
//Routes - Navigation
import 'package:flutter/material.dart';

import '../../core/auth/login/screens/login.dart';
import '../../core/auth/register/screens/register.dart';

Map<String,WidgetBuilder>getRoutes() {
  return {
    '/':(context) => const Login(),
    //when 
    '/register':(context) => const Register(),
  };
}