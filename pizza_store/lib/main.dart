import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pizza_store/cubit/cartState.dart';
import 'package:pizza_store/screens/order.dart';

import 'cubit/cart_item_cubit.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    home: BlocProvider(create: (context) => CartItemCubit(cartState(0, 0)),child: Order()),
  ));
}
