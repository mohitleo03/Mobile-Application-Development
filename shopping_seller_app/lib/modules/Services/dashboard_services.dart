import 'dart:convert';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import 'package:shopping_seller_app/modules/models/sales_data.dart';

import '../models/orders.dart';

class DashboardServices {
  late List<Order> orders = [];
  converetOrders(dynamic orderData) {
    String str = orderData.data.toString();
    Map temp = jsonDecode(str);
    List<dynamic> list = temp["Orders"];
    orders = list.map((order) => Order.FromJSON(order)).toList();
  }

  Map<String, double> getOrdersCountByStatus() {
    Map<String, double> map = {
      OrderStatus.PENDING: 0,
      OrderStatus.DELIVERED: 0,
      OrderStatus.CANCELLED: 0
    };
    orders.forEach((order) {
      if (order.order_status == OrderStatus.PENDING) {
        map[OrderStatus.PENDING] = map[OrderStatus.PENDING]! + 1;
      } else if (order.order_status == OrderStatus.DELIVERED) {
        map[OrderStatus.DELIVERED] = map[OrderStatus.DELIVERED]! + 1;
      } else {
        map[OrderStatus.CANCELLED] = map[OrderStatus.CANCELLED]! + 1;
      }
    });
    return map;
  }

  List<SalesData> getSalesData() {
    DateTime currentDate = DateTime.now();
    List<SalesData> data = [];
    for (int i = 0; i < 5; i++) {
      data.add(SalesData(
          DateTime(
              currentDate.year, currentDate.month, currentDate.day - (i * 5)),
          0));
    }
    data = data.reversed.toList();
    for (int i = 0; i < orders.length; i++) {
      if (orders[i].date.isAfter(DateTime(
              currentDate.year, currentDate.month, currentDate.day - 30)) &&
          orders[i].date.isBefore(data[0].date)) {
        data[0].sales += orders[i].price;
      } else if (orders[i].date.isBefore(data[1].date)) {
        data[1].sales += orders[i].price;
      } else if (orders[i].date.isBefore(data[2].date)) {
        data[2].sales += orders[i].price;
      } else if (orders[i].date.isBefore(data[3].date)) {
        data[3].sales += orders[i].price;
      } else {
        data[4].sales += orders[i].price;
      }
    }
    print(data);
    return data;
  }
}
