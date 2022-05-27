class Order {
  String id = "";
  late List<Map<String, dynamic>> products;
  late String user_emailid;
  late double pricel;
  late String order_status;
  late String delivery_address; //take iput from user
  late String delivery_zone; //process the address and find out his/her zone
  late String delivered_by;
  late DateTime date;
}
