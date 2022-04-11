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
    this.getSongsList = getSongsList;
    // this.callSetState = callSetState;
    api.getSongs(setSongsList, getError);
    // ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
    //   // Do stuff on phone shake
    //   playSong();
    // });
    // player.onPlayerCompletion.listen((event) {
    //   // songs[currentIndex].isPlaying = false;   //done in _playNextSong()
    //   playSong();
    // });
  }

  setSongsList(List<Song> songs) {
    this.songs = songs;
    getSongsList(songs);
  }

  getError(dynamic error) {
    print("Error found in network call $error");
  }

  Song getSong(int index) {
    return songs[index];
  }
//   playSong() {
//     if (currentIndex < songs.length - 1) {
//       currentIndex++;
//     } else {
//       currentIndex = 0;
//     }
//     pauseOtherSongs(currentIndex);
//     songs[currentIndex].isPlaying = true;
//     player.play(songs[currentIndex].audio);
//     callSetState();
//   }

//   List<Song> pauseOtherSongs(int index) {
//     int i = 0;
//     songs = songs.map((Song song) {
//       if (i != index) {
//         song.isPlaying = false;
//         i++;
//         return song;
//       } else {
//         i++;
//         return song;
//       }
//     }).toList();
//     callSetState();
//     return songs;
//   }

//   searchSongs(searchValue) {
//     api.getSongs(setSongsList, getError, searchValue: searchValue);
//     callSetState();
//   }
}
