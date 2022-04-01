import 'dart:convert' as jsonconvert;
import 'package:http/http.dart' as http;
import '../models/song.dart';

class ApiClient {
  getSongs() {
    String URL = "https://itunes.apple.com/search?term=jack+johnson&limit=25";
    Future<http.Response> future = http.get(Uri.parse(URL));
    future.then((response) {
      String json = response.body;
      // print("JSON $json");
      // print(json.runtimeType);
      Map<String, dynamic> map =
          jsonconvert.jsonDecode(json); //Json Convert into Map
      //print("Map is $map and Map Type is ${map.runtimeType}");
      List<Map> list = map["results"]; //get the list from map
      List<Song> songs = list
          .map((element) => Song(element['artistName'], element['trackName'],
              element['artworkUrl30'], element['previewUrl']))
          .toList(); //traverse the lsit & get one by one map
      // and convert map into song object and song object store in a song list
      print(songs);
    }).catchError((err) => print(err));
  }
}

void main() {
  ApiClient obj = ApiClient();
  obj.getSongs();
}
