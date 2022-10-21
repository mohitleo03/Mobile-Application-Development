import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_store/Utils/stringHelper.dart';
import 'package:pizza_store/cubit/cartState.dart';
import 'package:pizza_store/models/product.dart';

import '../cubit/cart_item_cubit.dart';

class card extends StatelessWidget {
  late Product product;
  card(this.product);
  @override
  Widget build(BuildContext context) {
    CartItemCubit cubit = BlocProvider.of<CartItemCubit>(context);
    return Container(
      child: Row(
        children: [
          Container(height: 100, width: 100, child: Image.network(product.URL)),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(product.name),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Text(product.price.toString()),
                    ),
                    IconButton(
                      color: Colors.blue,
                        onPressed: () {
                          cubit.plus(1, product.price);
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
                Container(
                  child: Text(reduceString(product.desc)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
