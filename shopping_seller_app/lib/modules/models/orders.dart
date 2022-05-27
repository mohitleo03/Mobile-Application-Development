class Order {
  String id = "";
  late List<Map<String, dynamic>> products;
  late String user_emailid;
  late double price;
  late String order_status;
  // late String delivery_address; //take iput from user
  late String delivery_zone; //process the address and find out his/her zone
  late String delivered_by;
  late DateTime date;
  Order(
      {required this.products,
      required this.user_emailid,
      required this.price,
      required this.order_status,
      // required this.delivery_address,
      required this.delivery_zone,
      required this.delivered_by,
      required this.date});
  Order.FromJSON(Map<String, dynamic> order) {
    products = order["products"];
    user_emailid = order["user_emailid"];
    price = order["price"];
    order_status = order["order_status"];
    delivery_zone = order["delivery_zone"];
    delivered_by = order["delivered_by"];
    date = DateTime.parse(order["date"]);
  }
}
