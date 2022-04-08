import 'dart:convert' as jsonconvert;
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:music_app_class/config/constants/api_path.dart';
import 'package:music_app_class/utils/interceptors/token.dart';
import '../../models/song.dart';

class ApiClient {
  static Dio _dio = Dio();
  ApiClient._() {}
  static ApiClient _apiCleint = ApiClient._();
  static ApiClient getInstance() {
    tokenInterceptor(_dio);
    return _apiCleint;
  }

  void getSongs(Function successCallBack, Function failCallBack,
      {String searchValue = "AP Dhillon"}) {
    // final URL = "https://itunes.apple.com/search?term=$searchValue&limit=25";
    final URL = "${ApisPath.BASE_URL}?term=$searchValue&limit=25";
    // Future<http.Response> future = http.get(Uri.parse(URL));
    Future<Response> future = _dio.get(URL);
    future.then((response) {
      String json = response.data;
      // print("JSON $json");
      // print(json.runtimeType);
      Map<String, dynamic> map =
          jsonconvert.jsonDecode(json); //Json Convert into Map
      //print("Map is $map and Map Type is ${map.runtimeType}");
      List<dynamic> list = map["results"]; //get the list from map
      // List<Song> songs = list
      //     .map((element) => Song(element['artistName'], element['trackName'],
      //         element['artworkUrl30'], element['previewUrl']))
      //     .toList(); //traverse the lsit & get one by one map
      // and convert map into song object and song object store in a song list
      List<Song> songs = list.map((songMap) => Song.fromJSON(songMap)).toList();
      int i = 1;
      print(songs);
      songs.forEach((element) {
        print("${i++} ${element.audio}");
      });
      successCallBack(songs);
    }).catchError((err) => failCallBack(err));
  }
}
