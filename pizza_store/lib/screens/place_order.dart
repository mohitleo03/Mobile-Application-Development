import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cartState.dart';
import '../cubit/cart_item_cubit.dart';

class placeOrder extends StatelessWidget {
  const placeOrder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: BlocBuilder<CartItemCubit, cartState>(
                                builder: (ctx, state) {
                              return Text(
                                ' Total Items are ${state.count} and ${state.price} is Total Amount',
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                              );
                            }),
      ),
    );
  }
}