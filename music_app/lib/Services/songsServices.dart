import 'package:audioplayers/audioplayers.dart';
import '/models/song.dart';
import '/widgets/toast_message.dart';
import 'package:shake/shake.dart';

import '/utils/helpers/string_helper.dart';
import '/utils/services/api_client.dart';

class songsServices {
  List<Song> songs = [];
  int currentIndex = -1;
  AudioPlayer player = AudioPlayer();
  ApiClient api = ApiClient.getInstance();
  late Function getSongsList;
  late Function callSetState;
  static songsServices Operations = songsServices._();
  static songsServices getInstance() {
    return Operations;
  }

  songsServices._() {}

  initialize({required Function getSongsList, String searchValue = ""}) {
    // initialize(Function getSongsList, {String searchValue = ""}) { //not getting result if i am passing a search parameter??
    this.getSongsList =
        getSongsList; //increasing scope of the function which will send songs to other file so that we can call it when we get songs

    // this.callSetState = callSetState;
    searchValue==""?api.getSongs(setSongsList, getError,):
    api.getSongs(setSongsList, getError,
        searchValue: searchValue); //calling API
    // api.getSongs(setSongsList, getError); //calling API
  }

  setSongsList(List<Song> songs) {
    this.songs = songs.map((Song song) {
      //increasing scope of songs
      song.trackName =
          reduceStringLength(song.trackName, 30); //reducing length of trackName
      song.artistName = reduceStringLength(
          song.artistName, 20); //reducing length of trackName
      return song;
    }).toList();
    getSongsList(
        songs); //sending sings back to the class by calling this function & passing the songs as an argument
  }

  getError(dynamic error) {
    print("Error found in network call $error");
  }

  Song getSong(int index) {
    return songs[index]; //sending single songs on the given index
  }
}
