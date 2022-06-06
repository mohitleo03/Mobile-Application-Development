import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sidebar_demo/bloc_navigation/navigation_bloc.dart';

class OrdersPage extends StatelessWidget{
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Orders Page"),
    );
  }
}
