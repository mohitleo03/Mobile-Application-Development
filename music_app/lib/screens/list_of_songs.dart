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
  AudioPlayer player = AudioPlayer();
  int currentIndex = -1;
  List<Song> songs = [];
  ApiClient api = ApiClient.getInstance();
  Icon playIcon = _icon(Icons.play_arrow, 20, Colors.redAccent);
  Icon pauseIcon = _icon(Icons.pause, 20, Colors.redAccent);

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
  }

  getSongsList(List<Song> songs) {
    this.songs = songs;
    setState(() {});
  }

  getError(dynamic error) {
    print("Error found in network call $error");
    setState(() {});
  }

  Center _showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
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
    setState(() {});
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
          title: Text('Songs'),
        ),
        body: Container(child: songs.isEmpty ? _showLoading() : _printSong()));
  }
}
