import 'package:audioplayers/audioplayers.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/utils/api_client.dart';
import 'package:music_app/widgets/toast_message.dart';
import 'package:shake/shake.dart';

class songsServices {
  List<Song> songs = [];
  int currentIndex = -1;
  AudioPlayer player = AudioPlayer();
  ApiClient api = ApiClient.getInstance();
  late Function getSongsList;
  late Function callSetState;
  static songsServices Services = songsServices._();
  static songsServices getInstance() {
    return Services;
  }

  songsServices._() {}

  initialize(Function getSongsList) {
    // initialize(Function getSongsList, {String searchValue = ""}) { //not getting result if i am passing a search parameter??
    this.getSongsList =
        getSongsList; //increasing scope of the function which will send songs to other file so that we can call it when we get songs

    // this.callSetState = callSetState;
    // api.getSongs(setSongsList, getError,
    //     searchValue: searchValue); //calling API
    api.getSongs(setSongsList, getError); //calling API
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

  String reduceStringLength(String string, int length) {
    //function to reduce the length of content so that it won't look bad on screen
    String shortString = string;
    if (shortString.length > length) {
      shortString = shortString.substring(0, length) + "...";
    }
    return shortString;
  }
}
