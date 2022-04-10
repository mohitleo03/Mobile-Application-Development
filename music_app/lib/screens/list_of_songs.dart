import 'package:another_flushbar/flushbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Screens/player.dart';
import 'package:music_app/Services/SongsServices.dart';
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
  String searchValue = "";
  TextEditingController searchCtrl = TextEditingController();
  bool loading = true;
  AudioPlayer player = AudioPlayer();
  int currentIndex = -1;
  List<Song> songs = [];
  // songsServices songsService = songsServices.getInstance();
  ApiClient api = ApiClient.getInstance();
  Icon playIcon = _icon(Icons.play_arrow, 20, Colors.redAccent);
  Icon pauseIcon = _icon(Icons.pause, 20, Colors.redAccent);

  @override
  void initState() {
    // songsService.initialize();
    // songs = songsService.getSongsList();
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
    loading = true;
    return ListView.builder(
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          onTap: _openPlayer,
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

  _searchSongs() {
    api.getSongs(getSongsList, getError, searchValue: searchValue);
    player.stop();
    songs = [];
    setState(() {});
  }

  _openPlayer() {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Player()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            title: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextField(
                  onChanged: (String value) => {searchValue = value},
                  controller: searchCtrl,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          _searchSongs();
                        }),
                    hintText: "Type to Search",
                    labelText: "Search here",
                  ),
                ),
              ),
            )),
        body: Container(
            child: songs.isEmpty
                ? loading
                    ? _showLoading()
                    : _showLoadingError()
                : _printSong()));
  }
}
