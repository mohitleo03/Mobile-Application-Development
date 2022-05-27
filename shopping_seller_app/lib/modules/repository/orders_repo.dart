//Currently getting orders data from json later on it will be retrieved from firebase firestore database


import 'package:dio/dio.dart';

class ProductRepo {
  final URL = "https://raw.githubusercontent.com/mohitleo03/Mobile-Application-Development/main/shopping_seller_app/models%20%26%20fake%20data/orders.json";
  ProductRepo._();
  static ProductRepo productRepo = ProductRepo._();
  static ProductRepo getInstance() {
    return productRepo;
  }

  Dio _dio = Dio();
  getOrders()  {
    Future<Response> response =_dio.get(URL);
    return response;
  }
}
