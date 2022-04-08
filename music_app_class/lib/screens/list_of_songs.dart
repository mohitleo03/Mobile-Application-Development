import 'package:flutter/material.dart';
import 'package:music_app_class/config/constants/app_constants.dart';
import 'package:music_app_class/models/song.dart';
import 'package:music_app_class/screens/Player.dart';
import 'package:music_app_class/utils/services/api_client.dart';
import 'package:audioplayers/audioplayers.dart';

class ListOfSongs extends StatefulWidget {
  const ListOfSongs({Key? key}) : super(key: key);

  @override
  State<ListOfSongs> createState() => _ListOfSongsState();
}

class _ListOfSongsState extends State<ListOfSongs>{
  bool isPlay = false;
  List<Song> songs = [];
  int currentSongIndex = 0;
  AudioPlayer audioPlayer = AudioPlayer();
  TextEditingController searchCtrl = TextEditingController();
  ApiClient client = ApiClient.getInstance();
  dynamic err;
  @override
  void initState() {
    // TODO: implement initState
    audioPlayer.onPlayerCompletion.listen((event) {
      print("song is completed");
      songs[currentSongIndex].isPlaying = false;
      setState(() {});
    });
    client.getSongs(getSongsList, getSongsError);
  }

  _openPlayer(index) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Player(song: songs[index])));
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
            onTap: () {
              _openPlayer(index);
            },
            leading: Image.network(songs[index].image),
            title: Text(songs[index].trackName),
            subtitle: Text(songs[index].artistName),
            trailing: IconButton(
                onPressed: () async {
                  // print(isPlay);
                  int result = isPlay
                      ? await audioPlayer.pause()
                      : await audioPlayer.play(songs[index].audio);
                  isPlay = isPlay ? false : true;
                  songs[index].isPlaying =
                      songs[index].isPlaying ? false : true;
                  currentSongIndex = index;
                  pauseOtherSongs();
                  if(result == AppConstants.SUCCESS){

                  }
                  else{

                  }
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

  _searcSongs() {
    String searchValue = searchCtrl.text;
    client.getSongs(getSongsList, getSongsError, searchValue: searchValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100),
      //   child: AppBar(

      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: TextField(
            controller: searchCtrl,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () => _searcSongs(),
              ),
              labelText: "Search Here",
              hintText: "Type to Search",
            ),
          ),
          // title: Text("Songs"),
        ),
      ),
      body: Container(
        child: songs.isEmpty ? _showLoading() : _printSong(),
      ),
    );
  }
}
