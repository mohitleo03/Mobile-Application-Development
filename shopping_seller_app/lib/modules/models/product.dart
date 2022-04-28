import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  late String id;
  late String name;
  late String desc;
  late double price;
  late double qty;
  late String url;
  Product() {}
  Product.takeProduct(
      {this.id = "",
      required this.name,
      required this.desc,
      required this.price,
      required this.qty,
      this.url = "abcd.jpg"}) {
  }
  Product.fromJSON(QueryDocumentSnapshot map) {
    // id = map['documentID'];
    name = map['name'];
    url = map['url'];
    desc = map['desc'];
    price = map['price'];
    qty = map['qty'];
  }
  @override
  String toString() {
    return "Product name is $name , Product Description is $desc , Product Price is $price , Product Quantity is $qty";
  }

  Map<String, dynamic> toJSON() {
    return {'name': name, "desc": desc, "price": price, "qty": qty, "url": url};
  }
}
