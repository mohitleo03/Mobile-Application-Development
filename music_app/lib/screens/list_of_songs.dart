import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/utils/api_client.dart';

class ListOfSongs extends StatefulWidget {
  const ListOfSongs({Key? key}) : super(key: key);

  @override
  State<ListOfSongs> createState() => _ListOfSongsState();
}

class _ListOfSongsState extends State<ListOfSongs> {
  AudioPlayer player = AudioPlayer();
  List<Song> songs = [];
  bool isPlay = false;
  ApiClient api = ApiClient.getInstance();
  @override
  void initState() {
    // TODO: implement initState
    // ApiClient.client_operations_instance().getSongs();
    // ApiClient client = ApiClient();
    // client.getSongs();
    api.getSongs(getSongsList, getError);
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
                  isPlay
                      ? await player.pause()
                      : await player.play(songs[index].audio);
                  isPlay = !isPlay;
                },
                icon: Icon(
                  Icons.play_arrow,
                  size: 20,
                  color: Colors.redAccent,
                )),
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
