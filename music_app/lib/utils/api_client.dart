import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  getSongs() {
    String URL = "https://itunes.apple.com/search?term=jack+johnson&limit=25";
    Future<http.Response> future = http.get(Uri.parse(URL));
    future.then((response) {
      String json = response.body;
      print("JSON $json");
      print(json.runtimeType);
      json = jsonDecode(json);
      json.results
    }).catchError((err) => print(err));
  }
}

void main() {
  ApiClient obj = ApiClient();
  obj.getSongs();
}
