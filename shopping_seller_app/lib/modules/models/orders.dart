class products {
  late String product_id;
  late int quantity;
  products.FromJSON(Map<String, dynamic> map) {
    product_id = map["product_id"];
    quantity = map["quantity"];
  }
}

class Order {
  String id = "";
  late List<dynamic> products_list;
  // late List<products> products_list;
  late String user_id;
  late double price;
  late String order_status;
  // late String delivery_address; //take iput from user
  late String delivery_zone; //process the address and find out his/her zone
  late String delivered_by;
  late DateTime date;
  Order(
      {required this.products_list,
      required this.user_id,
      required this.price,
      required this.order_status,
      // required this.delivery_address,
      required this.delivery_zone,
      required this.delivered_by,
      required this.date});
  Order.FromJSON(Map<String, dynamic> order) {
    products_list = order["products"].map((product)=>products.FromJSON(product)).toList();
    //     List list =
    //     order["products"].map((product) => products.FromJSON(product)).toList();
    // products_list = list;
    products_list = order["products"];
    user_id = order["user_id"];
    price = double.parse(order["price"].toString());
    order_status = order["order_status"];
    delivery_zone = order["delivery_zone"];
    delivered_by = order["delivered_by"];
    date = DateTime.parse(order["date"]);
  }
  @override
  String toString() {
    // TODO: implement toString
    return "Order id is $id , Products are $products_list , User id is $user_id , Price is $price , Order Status is $order_status , Delivery Zone is $delivery_zone , Delivered by is $delivered_by";
  }
}
