import 'package:another_flushbar/flushbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Services/songsServices.dart';
import 'package:music_app/models/song.dart';
import 'package:shake/shake.dart';

class Player extends StatefulWidget {
  int songsLength; //songsLength is needed so that we can get correct song on boundary values
  Song song;
  int currentIndex;
  ShakeDetector
      parent_detector; //we have to start parent shake detector while this screen is closed so that on previous screen it will start detecting phone shake
  Function
      pauseAllSongs; //trying to pause all songs on previous screen when we get navigated to player screen but not working currently
  Player(this.song, this.currentIndex, this.parent_detector, this.pauseAllSongs,
      this.songsLength);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer player = AudioPlayer();
  List<Song> songs = [];
  int skipToInSeconds = 0; //getting value from slider
  Map<String, String> skipTo = {
    "minutes": "0",
    "seconds": "0"
  }; //still thinking it's utitlity
  Map<String, String> currentPointOfTime = {
    "minutes": "0",
    "seconds": "0"
  }; //to store & utilize the current point of time of song
  Map<String, String> totalTime = {
    "minutes": "0",
    "seconds": "0"
  }; //complete duration of song
  int totalTimeInSeconds = 29; // we may get total time in secods of any song
  late ShakeDetector detector; //shake detector of this screen
  late Duration totalDuration;
  late Duration position;

  songsServices songsService = songsServices.getInstance();

  @override
  void initState() {
    songsService.initialize(
        getSongsList); //need to initialize songsService so that songsService can send required songs
    widget.song.isPlaying =
        true; //the songs on which user tapped will be playing by default
    player.play(widget.song.audio);
    _getDurationOfSong();
    _getPositionOfSong();
    player.onPlayerCompletion.listen((event) {
      //using onCompletion event to play next song
      // songs[currentIndex].isPlaying = false;   //done in _playNextSong()
      _getSong(1); //first get next song 1 menas add one index and get song
    });
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      //shake detector of this screen to play next song on phone shake
      // Do stuff on phone shake
      _getSong(1);
    });
    player.play(widget.song.audio);
    totalTime = _getStandardTime(
        totalTimeInSeconds); //del this line when we get orignal total time
  }

  getSongsList(List<Song> songs) {
    //just getting songs because we were not able to get songs without initializing it
    this.songs = songs;
    setState(() {});
  }

  _play() {
    //if user press on play button
    widget.song.isPlaying = !widget.song.isPlaying;
    _toastMessage(title: "Playing Song", message: widget.song.trackName);
    player.play(widget.song.audio);
    setState(() {});
  }

  _pause() {
    //if user press on pause button
    widget.song.isPlaying = !widget.song.isPlaying;
    _toastMessage(title: "Song Paused", message: widget.song.trackName);
    player.pause();
    setState(() {});
  }

  _getSong(int index) {
    //getting song from songsService
    skipToInSeconds = 0; //on next song song will start from 0
    currentPointOfTime = {
      "minutes": "0",
      "seconds": "0"
    }; //so currentPoint of time is set to in starting 0 once
    player.stop(); //stop previous song
    widget.currentIndex +=
        index; //increase currentIndex by the index which might be -1 or 1
    if (widget.currentIndex == widget.songsLength) {
      //if we pressed next on last song of list we have to start from first element
      widget.currentIndex = 0;
    }
    if (widget.currentIndex == -1) {
      //if we pressed previous on first song of list then we have to play last song
      widget.currentIndex = widget.songsLength - 1;
    }
    widget.song = songsService.getSong(widget.currentIndex);
    _toastMessage(title: "Playing Next Song", message: widget.song.trackName);
    player.play(widget.song.audio);
    _getDurationOfSong();
    widget.song.isPlaying =
        true; //isPlaying true so that it will display pause icon
    setState(() {});
  }

  _toastMessage({required String title, required String message}) {
    Flushbar(
      title: title,
      message: message,
      duration: Duration(seconds: 2),
    )..show(context);
  }

  Map<String, String> _getStandardTime(int timeInSeconds) {
    //this function converts seconds into map variable which stores minutes & secodns as integer
    Map<String, String> timeInMinuteSeconds = {
      "minutes": (timeInSeconds ~/ 60)
          .toString(), //minutes = total seconds / 60 to int
      "seconds": (timeInSeconds % 60) < 10 //seconds = total seconds modules 60
          ? (timeInSeconds % 60) == 0
              ? "00" //if seconds modules 60 is 0 then store 00
              : "0${timeInSeconds % 60}" //if seconds modules 60 is lessthan 10 then store single digit we get from modules & 0 before that digit
          : (timeInSeconds % 60)
              .toString() //if modules is more than or equal to 10 store it as it is
    };
    return timeInMinuteSeconds; //return map
  }

  _seekTo(int seconds) {
    player.seek(Duration(
        seconds: seconds)); //this event let you seek at that point of song
  }

  _getDurationOfSong() async{
    await player.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      setState(() => totalDuration = d);
    });
  }

  _getPositionOfSong() async{
    await player.onAudioPositionChanged.listen((Duration p) {
      print('Current position: $p');
      setState(() => position = p);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    detector.stopListening(); //detector of this screen should be stopped
    player.stop(); //if any song is playing stop it
    widget
        .parent_detector //as we currently don't have any event whcih triggers when we get back to parent screen,
        .startListening(); //so while this screen is disposed we start listening the parent detector which we passed from parent screen while navigating
    // widget.pauseAllSongs();  //exception list of songs is locked
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Container(
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 132,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.song.image),
                      radius: 130,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.deepPurpleAccent,
                    Colors.purpleAccent,
                    Colors.purpleAccent,
                    Colors.pinkAccent
                  ])),
              height: deviceSize.height / 2.5,
              width: deviceSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              child: Text(widget.song.trackName,
                  style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: deviceSize.width / 18)),
            ),
            Text(widget.song.artistName,
                style: TextStyle(
                    color: Colors.blueAccent, fontSize: deviceSize.width / 24)),
            Container(
              width: deviceSize.width - 30,
              child: Column(
                children: [
                  Slider(
                      min: 0.0,
                      value: skipToInSeconds.toDouble(),
                      max: totalTimeInSeconds.toDouble(),
                      onChanged: (value) {
                        skipToInSeconds = value.toInt();
                        currentPointOfTime = _getStandardTime(value.toInt());
                        _seekTo(value.toInt());
                        setState(() {});
                      }),
                  Container(
                    width: deviceSize.width - 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${currentPointOfTime["minutes"]}:${currentPointOfTime["seconds"]}"),
                        // Text("${totalTime["minutes"]}:${totalTime["seconds"]}")
                        Text(totalDuration.inSeconds.toString())
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      _getSong(-1); //get previous song by passing -1
                      _toastMessage(
                          title: "Playing Previous Song",
                          message: widget.song.trackName);
                    },
                    icon: Icon(
                      Icons.skip_previous,
                      size: 45,
                      color: Colors.purpleAccent,
                    )),
                IconButton(
                    onPressed: () {
                      //play or pause song
                      widget.song.isPlaying ? _pause() : _play();
                    },
                    icon: Icon(
                      widget.song.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 45,
                      color: Colors.blueAccent,
                    )),
                IconButton(
                    onPressed: () {
                      _getSong(1); //call next song by passing 1
                      _toastMessage(
                          title: "Playing Next Song",
                          message: widget.song.trackName);
                    },
                    icon: Icon(
                      Icons.skip_next,
                      size: 45,
                      color: Colors.purpleAccent,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
