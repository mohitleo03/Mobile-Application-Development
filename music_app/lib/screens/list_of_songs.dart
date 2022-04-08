import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/utils/api_client.dart';

class ListOfSongs extends StatefulWidget {
  const ListOfSongs({Key? key}) : super(key: key);

  @override
  State<ListOfSongs> createState() => _ListOfSongsState();
}

class _ListOfSongsState extends State<ListOfSongs> {
  List<Song> Songs=[];
  @override
  void initState() {
    // TODO: implement initState
    // ApiClient.client_operations_instance().getSongs();
    // ApiClient client = ApiClient();
    // client.getSongs();
    ApiClient api = ApiClient.getInstance();
    api.getSongs(getSongsList, getError);
  }

  getSongsList(List<Song> Songs) {
    this.Songs = Songs;
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
          leading:Image.network(Songs[index].image),
          title: Text(Songs[index].trackName),
          subtitle: Text(Songs[index].artistName),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Icon(Icons.play_arrow,size: 20,color: Colors.redAccent),
          ),
        );
      },
      itemCount: Songs.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Songs'),
        ),
        body: Container(child: Songs.isEmpty ? _showLoading() : _printSong()));
  }
}
