import 'package:http/http.dart' as http;

class ApiClient {
  getSongs() {
    String URL = "https://itunes.apple.com/search?term=jack+johnson&limit=25";
    Future<http.Response> response = http.get(Uri.parse(URL));

  }
}
