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
  static songsServices Services = songsServices._();
  static songsServices getInstance() {
    return Services;
  }

  songsServices._() {}

  initialize() {
    api.getSongs(setSongsList, getError);
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      // Do stuff on phone shake
      playSong();
    });
    player.onPlayerCompletion.listen((event) {
      // songs[currentIndex].isPlaying = false;   //done in _playNextSong()
      playSong();
    });
  }

  setSongsList(List<Song> songs) {
    this.songs = songs;
  }

  List<Song> getSongsList() {
    return songs;
  }

  getError(dynamic error) {
    print("Error found in network call $error");
  }

  playSong() {
    if (currentIndex < songs.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    pauseOtherSongs(currentIndex);
    songs[currentIndex].isPlaying = true;
    player.play(songs[currentIndex].audio);
    toastMessage(
        title: "Playing next Song", message: songs[currentIndex].trackName);
  }

  pauseOtherSongs(int index) {
    int i = 0;
    songs = songs.map((Song song) {
      if (i != index) {
        song.isPlaying = false;
        i++;
        return song;
      } else {
        i++;
        return song;
      }
    }).toList();
  }

  searchSongs(searchValue) {
    api.getSongs(setSongsList, getError, searchValue: searchValue);
    player.stop();
    songs = [];
  }
}
