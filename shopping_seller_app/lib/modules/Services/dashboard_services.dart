import 'dart:convert';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';

import '../models/orders.dart';

class DashboardServices {
  late List<Order> orders = [];
  converetOrders(dynamic orderData) {
    String str = orderData.data.toString();
    Map temp = jsonDecode(str);
    List<dynamic> list = temp["Orders"];
    orders = list.map((order) => Order.FromJSON(order)).toList();
  }

  Map<String,double> getOrdersCountByStatus() {
    Map<String, double> map = {
      OrderStatus.PENDING: 0,
      OrderStatus.DELIVERED: 0,
      OrderStatus.CANCELLED: 0
    };
    orders.forEach((order) {
      if (order.order_status == OrderStatus.PENDING) {
        map[OrderStatus.PENDING]=map[OrderStatus.PENDING]!+1;
      }
      else if (order.order_status == OrderStatus.DELIVERED) {
        map[OrderStatus.DELIVERED]=map[OrderStatus.DELIVERED]!+1;
      }
      else{
        map[OrderStatus.CANCELLED]=map[OrderStatus.CANCELLED]!+1;
      }
    });
    return map;
  }
}
