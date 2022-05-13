import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pizza_store/config/api_path.dart';
import 'package:pizza_store/models/product.dart';

class ProductRepo {
  final URL = "${Apispath.URL}";
  ProductRepo._();
  static ProductRepo productRepo = ProductRepo._();
  static ProductRepo getInstance() {
    return productRepo;
  }

  Dio _dio = Dio();
  getProducts(
      Function getProducts, Function getError) async {
    Future<Response> response = _dio.get(URL);
    response.then((response) {
      Map<String, dynamic> map = jsonDecode(response.data);
      List<dynamic> list = map['Vegetarian'];
      List<Product> products =
          list.map((product) => Product.FromJSON(product)).toList();
      print(products);
      getProducts(products);
    }).catchError((error) => getError(error));
  }
}
