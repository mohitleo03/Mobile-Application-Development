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
  List<Song> songs = [];
  AudioPlayer audioPlayer = AudioPlayer();
  dynamic err;
  @override
  void initState() {
    // TODO: implement initState
    ApiClient client = ApiClient();

    client.getSongs(getSongsList, getSongsError);
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
                await audioPlayer.play(songs[index].audio);
              },
              icon: Icon(
                Icons.play_arrow,
                size: 20,
              ),
            ));
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
