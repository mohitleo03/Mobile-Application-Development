import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id = "";
  late String name;
  late String desc;
  late double price;
  late double qty;
  late String url;
  late String category;
  Product() {}
  Product.takeProduct(
      {this.id = "",
      required this.name,
      required this.desc,
      required this.price,
      required this.qty,
      required this.url,
      required this.category});
  Product.fromJSON(QueryDocumentSnapshot doc) {
    id = doc.id;
    name = doc['name'];
    url = doc['url'];
    desc = doc['desc'];
    price = double.parse(doc['price'].toString());
    qty = doc['qty'];
    category = doc['category'];
  }
  Product.fromMap(dynamic doc, this.id) {
    name = doc['name'];
    url = doc['url'];
    desc = doc['desc'];
    price = double.parse(doc['price'].toString());
    qty = doc['qty'];
    category = doc["category"];
  }
  @override
  String toString() {
    return "Product id is $id Product name is $name , Product Description is $desc , Product Price is $price , Product Quantity is $qty , Product category is $category";
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      "desc": desc,
      "price": price,
      "qty": qty,
      "url": url,
      "category": category
    };
  }
}
