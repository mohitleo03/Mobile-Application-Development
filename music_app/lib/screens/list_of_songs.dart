import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/utils/api_client.dart';
import 'package:audioplayers/audioplayers.dart';

class ListOfSongs extends StatefulWidget {
  const ListOfSongs({Key? key}) : super(key: key);

  @override
  State<ListOfSongs> createState() => _ListOfSongsState();
}

class _ListOfSongsState extends State<ListOfSongs> {
  bool isPlay = false;
  List<Song> songs = [];
  int currentSongIndex = 0;
  AudioPlayer audioPlayer = AudioPlayer();
  dynamic err;
  @override
  void initState() {
    // TODO: implement initState
    ApiClient client = ApiClient();
    audioPlayer.onPlayerCompletion.listen((event) {
      print("song is completed");
      songs[currentSongIndex].isPlaying = false;
      setState(() {});
    });
    client.getSongs(getSongsList, getSongsError);
  }

  pauseOtherSongs() {
    for (int i = 0; i < songs.length; i++) {
      if (i != currentSongIndex) {
        songs[i].isPlaying = false; 
      }
    }
  }

  getSongsList(List<Song> songs) {
    this.songs = songs;
    setState(() {});
  }

  getSongsError(dynamic err) {
    this.err = err;
    print(err);
    setState(() {});
  }

  Center _showLoading() {
    return Center(child: CircularProgressIndicator());
  }

  ListView _printSong() {
    return ListView.builder(
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
            leading: Image.network(songs[index].image),
            title: Text(songs[index].trackName),
            subtitle: Text(songs[index].artistName),
            trailing: IconButton(
                onPressed: () async {
                  
                  print(isPlay);
                  isPlay
                      ? await audioPlayer.pause()
                      : await audioPlayer.play(songs[index].audio);
                  isPlay = isPlay ? false : true;
                  songs[index].isPlaying =
                      songs[index].isPlaying ? false : true;
                  currentSongIndex = index;
                  pauseOtherSongs();
                  setState(() {});
                },
                icon: songs[index].isPlaying
                    ? Icon(
                        Icons.pause,
                        size: 20,
                      )
                    : Icon(
                        Icons.play_arrow,
                        size: 20,
                      )));
      },
      itemCount: songs.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Songs"),
      ),
      body: Container(
        child: songs.isEmpty ? _showLoading() : _printSong(),
      ),
    );
  }
}
