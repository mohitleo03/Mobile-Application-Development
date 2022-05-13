import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pizza_store/screens/order.dart';

void main(){
  // await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    home: Order(),
  ));
}
