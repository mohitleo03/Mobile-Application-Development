import 'package:another_flushbar/flushbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/utils/api_client.dart';
import 'package:shake/shake.dart';

class ListOfSongs extends StatefulWidget {
  const ListOfSongs({Key? key}) : super(key: key);

  @override
  State<ListOfSongs> createState() => _ListOfSongsState();
}

_icon(IconData icon, double size, Color color) {
  return Icon(icon, size: size, color: color);
}

class _ListOfSongsState extends State<ListOfSongs> {
  bool loading = true;
  AudioPlayer player = AudioPlayer();
  int currentIndex = -1;
  List<Song> songs = [];
  ApiClient api = ApiClient.getInstance();
  Icon playIcon = _icon(Icons.play_arrow, 20, Colors.redAccent);
  Icon pauseIcon = _icon(Icons.pause, 20, Colors.redAccent);

    @override
  void initState() {
    api.getSongs(getSongsList, getError);
    player.onPlayerCompletion.listen((event) {
      // songs[currentIndex].isPlaying = false;   //done in _playNextSong()
      _playSong();
    });
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      // Do stuff on phone shake
      _playSong();
    });
    Future.delayed(Duration(seconds: 3), () {
      loading = false;
      setState(() {});
    });
  }

  getSongsList(List<Song> songs) {
    this.songs = songs;
    setState(() {});
  }

  getError(dynamic error) {
    print("Error found in network call $error");
    setState(() {});
  }

  _playSong() {
    if (currentIndex < songs.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    _pauseOtherSongs(currentIndex);
    songs[currentIndex].isPlaying = true;
    player.play(songs[currentIndex].audio);
    _toastMessage(
        title: "Playing next Song", message: songs[currentIndex].trackName);
    setState(() {});
  }

  _pauseOtherSongs(int index) {
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
    setState(() {});
  }

  _toastMessage({required String title, required String message}) {
    Flushbar(
      title: title,
      message: message,
      duration: Duration(seconds: 2),
    )..show(context);
  }

  Center _showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Center _showLoadingError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  loading = true;
                  setState(() {});
                },
                icon: Icon(Icons.error)),
            Text("Netwrok Issue \n Tap to reload")
          ],
        ),
      ),
    );
  }

  _printSong() {
    return ListView.builder(
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          leading: Image.network(songs[index].image),
          title: Text(songs[index].trackName),
          subtitle: Text(songs[index].artistName),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 2),
            child: IconButton(
                onPressed: () async {
                  songs[index].isPlaying
                      ? await player.pause()
                      : await player.play(songs[index].audio);
                  songs[index].isPlaying = !songs[index].isPlaying;
                  _pauseOtherSongs(index);
                  currentIndex = index;
                  songs[index].isPlaying
                      ? _toastMessage(
                          title: "Song is Playing",
                          message: songs[index].trackName)
                      : _toastMessage(
                          title: "Song is Paused",
                          message: songs[index].trackName);
                  setState(() {});
                },
                icon: songs[index].isPlaying ? pauseIcon : playIcon),
          ),
        );
      },
      itemCount: songs.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Container(
                  height: 10,
                ),                
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    suffixIcon: Icon(Icons.search),
                    hintText: "Type to Search",
                    labelText: "Search here",
                  ),
                ),
              ],
            ),
          )
        ),
        body: Container(
            child: songs.isEmpty
                ? loading
                    ? _showLoading()
                    : _showLoadingError()
                : _printSong()));
  }
}