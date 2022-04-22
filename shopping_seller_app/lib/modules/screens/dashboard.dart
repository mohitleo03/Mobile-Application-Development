import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/widgets/add_product.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AddPrduct()
        ),
    );
  }
}