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
      required this.url});
  Product.fromJSON(QueryDocumentSnapshot doc) { //for future builder
    id = doc.id;
    name = doc['name'];
    url = doc['url'];
    desc = doc['desc'];
    price = double.parse(doc['price'].toString());
    qty = doc['qty'];
  }
  Product.fromMap(dynamic doc,this.id) {  //for stream builder
    name = doc['name'];
    url = doc['url'];
    desc = doc['desc'];
    price = double.parse(doc['price'].toString());
    qty = doc['qty'];
  }
  @override
  String toString() {
    return "Product id is $id Product name is $name , Product Description is $desc , Product Price is $price , Product Quantity is $qty";
  }

  Map<String, dynamic> toJSON() {
    return {'name': name, "desc": desc, "price": price, "qty": qty, "url": url};
  }
}
