import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '/Screens/player.dart';
import '../Services/songsServices.dart';
import '/utils/animations/waves.dart';
import '/config/constants/app_constants.dart';
import '/models/song.dart';
import 'package:shake/shake.dart';

import '../utils/services/api_client.dart';
import '../widgets/toast_message.dart';

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
  songsServices songsService = songsServices.getInstance();
  ApiClient api = ApiClient.getInstance();
  late ShakeDetector detector;
  Icon playIcon = _icon(Icons.play_arrow, 20, Color.fromARGB(255, 2, 38, 67));
  Icon pauseIcon = _icon(Icons.pause, 20, Color.fromARGB(255, 2, 38, 67));
  late BuildContext ctx;

  @override
  void initState() {
    songsService.initialize(
        getSongsList:
            getSongsList); //initialize method songsService in which API is called
    // songs = songsService.getSongsList();     //songs will coe later through API call so we were not getting any songs here
    // api.getSongs(getSongsList, getError);    //shifted API call to songsService, Widget class should be used only for rendering GUI
    player.onPlayerCompletion.listen((event) {
      //on completion event of audio of player
      // songs[currentIndex].isPlaying = false;   //done in _playNextSong()
      _playSong(); //play next song on completion
    });
    detector = ShakeDetector.waitForStart(onPhoneShake: () {
      //detect phone shake
      // Do stuff on phone shake
      _playSong(); //play next song on phone shake
    });
    detector.startListening(); //started shake listening event
    Future.delayed(Duration(seconds: 3), () {
      //after 3 seconds loading should stop & Network error will be shown
      loading =
          false; //if loading is false it will show error after re-rendering
      setState(() {}); //re-render after 3 seconds
    });
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => {testing()}));
  }

  getSongsList(List<Song> songs) {
    //this funtion is passed into songsService initialize function which will call this function when we get songs through API call & pass those songs into this function as argument to this file while calling this function
    this.songs =
        songs; //increase scope of songs list so that we can use it outside
    setState(() {}); //re-render so that they will be displayed
  }

  getError(dynamic error) {
    //this function is passed into songsService initialize function which will call this function on error with API call
    print("Error found in network call $error");
    setState(() {});
  }

  _playSong() {
    //this function will play next song
    if (currentIndex < songs.length - 1) {
      currentIndex++;
    } else {
      currentIndex =
          0; //if ewew reached to last item of list then next song will be the fisrt song
    }
    _pauseOtherSongs(currentIndex); //pausing all other songs
    songs[currentIndex].isPlaying =
        true; //isPlaying true for showing pause button
    player.play(songs[currentIndex].audio); //playing song by audio player
    // _toastMessage(
    //     title: "Playing next Song", message: songs[currentIndex].trackName);
    toastMessage(
      title: "Playing next Song",
      message: songs[currentIndex].trackName,
      context: ctx,
    );
    setState(() {});
  }

  _pauseOtherSongs(int index) {
    //pausing all other songs leaving the sog on this index
    int i = 0; //for comparing index
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
    setState(
        () {}); //re-render will display pause icon on all other songs leaving the song on the index because it' isPlaying is true
  }

  // _toastMessage({required String title, required String message}) {
  //   Flushbar(
  //     title: title,
  //     message: message,
  //     duration: Duration(seconds: 2),
  //   )..show(context);
  // }

  Center _showLoading() {
    //Simple loading till we get songs
    Future.delayed(Duration(seconds: 3), () {
      //if still loading till 3 sec
      loading =
          false; //switch loading bool value to false & re-render which will show Network error
      setState(() {});
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Center _showLoadingError() {
    //after 3 seconds this error will be displayed
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  songsService.initialize(
                      getSongsList:
                          getSongsList); //call api again when user taps on retry otherwise
                  loading =
                      true; //user will stuck in loading forever becuase if user's network was down
                  setState(
                      () {}); //then network call will give error in response so we have to do call this API after user clicks on tap to retry
                },
                icon: Icon(Icons.error)),
            Text("Netwrok Issue \n Tap to reload")
          ],
        ),
      ),
    );
  }

  _printSong() {
    //printing songs via ListView
    loading = true;
    return ListView.builder(
      itemBuilder: (BuildContext ctx, int index) {
        // print(songs[index].isPlaying);
        //building each item while iterarting the list
        return ListTile(
          onTap: () {
            _openPlayer(index);
          },
          leading: Image.network(songs[index].image),
          title: Text(songs[index].trackName),
          subtitle: Text(songs[index].artistName),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 2),
            child: IconButton(
              icon: songs[index].isPlaying ? pauseIcon : playIcon,
              onPressed: () async {
                int result = songs[index].isPlaying
                    ? await player
                        .pause() //if isPlaying is true then & button is pressed then pause the song
                    : await player.play(songs[index]
                        .audio); //if isPlaying is false then & bu70tton is pressed then play the song
                if (result == AppConstants.SUCCESS) {
                  print("Song is playing");
                } else {
                  print("Some issue with playing song");
                  //we can maintain logs here beucase we have issues if reached else
                }
                songs[index].isPlaying = !songs[index]
                    .isPlaying; //toggle the value after user pressed the button
                _pauseOtherSongs(
                    index); //call pause other songs so that all songs or previous song will show pause button
                currentIndex = index; //increase scope of index
                songs[index].isPlaying //display toast message accrodingly
                    ? toastMessage(
                        title: "Song is Playing",
                        message: songs[index].trackName,
                        context: ctx,
                      )
                    : toastMessage(
                        title: "Song is Paused",
                        message: songs[index].trackName,
                        context: ctx,
                      );
                setState(() {});
              },
            ),
          ),
        );
      },
      itemCount: songs.length,
    );
  }

  _searchSongs() {
    //anything user types in search box will be joined with API URL for getting desired result
    songsService.initialize(
        getSongsList: getSongsList,
        searchValue: searchCtrl.text); //doing API call again
    // api.getSongs(getSongsList, getError, searchValue: searchValue);
    player.stop();
    songs =
        []; //empty the songs list otherwise user will be displayed old songs untill backend loading or in case of errro too
    setState(() {});
  }

  _openPlayer(int index) {
    //navigates to a player screen which is dedicatedly built for playing song on which user tapped
    detector
        .stopListening(); //as we are moving to next screen we have to stop the shake detector otherwise when user shakes on next screen preevious detector will also listen & start doing it's functionality
    player.stop(); //stop this screens song
    currentIndex = -1; //giving initial value to currentIndex
    pauseAllSongs(); //trying to pause all songs but last song which was playing is not showing pause button
    // print(songs[index].isPlaying);
    Navigator.of(context).push(MaterialPageRoute(
        //navigation command / code
        builder: (ctx) => Player(
            // songs[index], index, detector, pauseAllSongs, songs.length)));
            songs[index],
            index,
            detector,
            pauseAllSongs,
            songs.length,
            songsService)));
    songs.forEach((element) {
      print("Song is ${element.isPlaying}");
    });
  }

  pauseAllSongs() {
    //all songs are paused
    songs = songs.map((Song song) {
      song.isPlaying = false;
      return song;
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    songs.forEach((element) {
      print("Song is ${element.isPlaying}");
    });
    ctx = context;
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
                          _searchSongs(); //after user pressed this search button function will be called which was calling API
                        }),
                    hintText: "Type to Search",
                    labelText: "Search here",
                  ),
                ),
              ),
            )),
        body: Container(
            child: songs.isEmpty
                ? loading //if songs list is empty means songs are yet to be loaded from API call
                    ? _showLoading() //if loading is true show loading
                    : _showLoadingError() //if app was loading from 3 seconds show error
                : _printSong())); //print all songs if we get songs from API call
  }
}
