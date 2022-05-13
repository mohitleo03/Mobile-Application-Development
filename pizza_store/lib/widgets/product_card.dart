import 'package:flutter/material.dart';
import 'package:pizza_store/Utils/stringHelper.dart';
import 'package:pizza_store/models/product.dart';

class card extends StatelessWidget {
  late Product product;
  card(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.network(product.URL)
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(product.name),
                ),
                Row(
                  children: [
                    Container(
                      child: Text(product.price.toString()),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.add))
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
