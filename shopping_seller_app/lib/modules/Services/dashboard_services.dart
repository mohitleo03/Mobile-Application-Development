import 'dart:convert';

import '../models/orders.dart';

class DashboardServices {
  Map getOrdersCountByStatus(dynamic orderData) {
    Map<String, int> map = {};
    String str = orderData.data.toString();
    Map temp = jsonDecode(str);
    List<dynamic> list = temp["Orders"];
    List<Order> orders = list.map((order) => Order.FromJSON(order)).toList();
    return map;
  }
}
