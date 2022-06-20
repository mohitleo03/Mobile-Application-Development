import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'config/constants/AppConstants.dart';
import 'config/routes/routes.dart';

void main(List<String> args)  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    // home: Dashboard(), //once initial route defined no need to mention home
    initialRoute: RouteConstants.LOGIN, //inital or base route
    routes: getRoutes(), //all routes are loaded here 
  ));
}