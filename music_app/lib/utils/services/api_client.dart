import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;
import '/config/constants/api_path.dart';
import 'dart:convert' as jsonconvert;
import '/models/song.dart';

class ApiClient {
  ApiClient._() {}
  static ApiClient _Api = ApiClient._();

  Dio _dio = Dio();
  static ApiClient getInstance() {
    return _Api;
  }

  void getSongs(Function successCallBack, Function failCallBack,
      {String searchValue = "honey singh"}) {
    final URL = "${Apispath.BASE_URL}?term=$searchValue&limit=15";
    // Future<http.Response> future = http.get(Uri.parse(URL));
    Future<Response> future = _dio.get(URL);
    future.then((response) {
      String json = response.data;
      //Doing JSON conversion and Store in Song model
      Map<String, dynamic> map =
          jsonconvert.jsonDecode(json); //JSON convert into Map
      // print("Map is $map");
      // print("map run time type is ${map.runtimeType}");
      // print("JSON is $json");
      // print("Run time type of JSON is ${json.runtimeType}");
      List<dynamic> list = map['results']; //Get the List from The map

      //Non - Standard Approach to convert json to song object
      // List Songs = list
      //     .map((element) => Song(element['artistName'], element['trackName'],
      //         element['artworkUrl100'], element['previewUrl']))
      //     .toList(); //Traverse the list to get map one by one
      //then convert the map into Song object & song Objects into Song List

      //Standard Appraoch of converting JSON to song object
      List<Song> Songs = list.map((songMap) => Song.fromJSON(songMap)).toList();
      successCallBack(Songs);
      // print(Songs);
      // Songs.forEach((e) => print(e.artistName));
    }).catchError((err) => failCallBack(err));
  }
}
