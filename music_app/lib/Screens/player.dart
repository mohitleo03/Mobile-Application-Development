import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Services/songsServices.dart';
import 'package:music_app/models/song.dart';
import 'package:shake/shake.dart';

class Player extends StatefulWidget {
  int songsLength;
  Song song;
  int currentIndex;
  ShakeDetector parent_detector;
  Function pauseAllSongs;
  Player(this.song, this.currentIndex, this.parent_detector, this.pauseAllSongs,
      this.songsLength);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer player = AudioPlayer();
  List<Song> songs = [];
  double skipTo = 0.0;
  double currentSeconds = 0.0;
  double totalSeconds = 0.0;
  late ShakeDetector detector;

  songsServices songsService = songsServices.getInstance();

  @override
  void initState() {
    songsService.initialize(getSongsList);
    widget.song.isPlaying = true;
    player.play(widget.song.audio);
    player.onPlayerCompletion.listen((event) {
      // songs[currentIndex].isPlaying = false;   //done in _playNextSong()
      _getSong(1);
    });
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      // Do stuff on phone shake
      _getSong(1);
    });
  }

  getSongsList(List<Song> songs) {
    this.songs = songs;
    setState(() {});
  }

  _play() {
    widget.song.isPlaying = !widget.song.isPlaying;
    player.play(widget.song.audio);
    setState(() {});
  }

  _pause() {
    widget.song.isPlaying = !widget.song.isPlaying;
    player.pause();
    setState(() {});
  }

  _getSong(int index) {
    print("object");
    player.pause();
    widget.currentIndex += index;
    if (widget.currentIndex == widget.songsLength) {
      widget.currentIndex = 0;
    }
    if (widget.currentIndex == -1) {
      widget.currentIndex = widget.songsLength - 1;
    }
    widget.song = songsService.getSong(widget.currentIndex);
    player.play(widget.song.audio);
    widget.song.isPlaying = true;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    detector.stopListening();
    player.stop();
    widget.parent_detector
        .startListening(); //this will start shake detector of parent screen / previous screen
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
                    backgroundImage: NetworkImage(widget.song.image),
                    radius: 130,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [Colors.purple, Colors.blue])),
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
                      value: skipTo,
                      onChanged: (value) {
                        skipTo = value;
                      }),
                  Container(
                    width: deviceSize.width - 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(currentSeconds.toString()),
                        Text(totalSeconds.toString())
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
                      _getSong(-1);
                    },
                    icon: Icon(
                      Icons.skip_previous,
                      size: 45,
                      color: Colors.purpleAccent,
                    )),
                IconButton(
                    onPressed: () {
                      widget.song.isPlaying ? _pause() : _play();
                    },
                    icon: Icon(
                      widget.song.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 45,
                      color: Colors.blueAccent,
                    )),
                IconButton(
                    onPressed: () {
                      _getSong(1);
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