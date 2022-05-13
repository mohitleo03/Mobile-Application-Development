class Product {
  late int id;
  late String name;
  late double price;
  late String desc;
  late String URL;
  Product.FromJSON(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    price = map['price'];
    desc = map['description'];
    URL = map['url'];
  }
}
