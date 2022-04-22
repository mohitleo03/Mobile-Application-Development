class Product {
  late int id;
  late String name;
  late String desc;
  late double price;
  late double qty;
  late String url;
  Product() {}
  Product.takeProduct(
      {this.id = 0,
      required this.name,
      required this.desc,
      required this.price,
      required this.qty,
      this.url = "abcd.jpg"});
  @override
  String toString() {
    return "Product name is $name , Product Description is $desc , Product Price is $price , Product Quantity is $qty";
  }

  Map<String,dynamic>toJSON() {
    return {'name': name, "desc": desc, "price": price, "qty": qty, "url": url};
  }
}
