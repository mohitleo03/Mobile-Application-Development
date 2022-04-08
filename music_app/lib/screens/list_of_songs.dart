import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/utils/api_client.dart';

class ListOfSongs extends StatefulWidget {
  const ListOfSongs({Key? key}) : super(key: key);

  @override
  State<ListOfSongs> createState() => _ListOfSongsState();
}

class _ListOfSongsState extends State<ListOfSongs> {
  late List<Song> Songs;
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
  }

  getError(dynamic error) {
    print("Error found in network call $error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
      ),
      body: Container(
          // child: ListView.builder(itemBuilder: (){

          // },itemCount: ,),
          ),
    );
  }
}
