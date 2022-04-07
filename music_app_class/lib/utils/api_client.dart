import 'dart:convert' as jsonconvert;
import 'package:http/http.dart' as http;
import '../models/song.dart';

class ApiClient {
  void getSongs(Function successCallBack, Function failCallBack ,{String searchValue = "AP Dhillon"}) {
    final URL = "https://itunes.apple.com/search?term=$searchValue&limit=25";
    Future<http.Response> future = http.get(Uri.parse(URL));
    future.then((response) {
      String json = response.body;
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

void main() {
  ApiClient obj = ApiClient();
  //obj.getSongs();
}
