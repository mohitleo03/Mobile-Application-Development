import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app_class/models/song.dart';

late Song currentSong;

class Player extends StatefulWidget {
  Player({required song}) {
    currentSong = song;
  }

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer player = AudioPlayer();
  Duration? _duration;
  Duration? _positioned;
  bool isPlay = false;
  _play() {
    if (isPlay) {
      player.pause();
    } else {
      player.play(currentSong.audio);
    }
      isPlay = !isPlay;
  }

  @override
  void initState() {
    super.initState();
    _initPlayerThings();
  }

  _initPlayerThings() {
    player.onDurationChanged.listen((duration) {
      _duration = duration;
      setState(() {});
    });
    player.onAudioPositionChanged.listen((position) {
      _positioned = position;
      setState(() {
        
      });
    });
    player.onPlayerCompletion.listen((duration) {});
  }

  Widget _circularAvatar() {
    return CircleAvatar(
      radius: 130,
      backgroundImage: NetworkImage(currentSong.image),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Container(
                  height: deviceSize.height / 2,
                  width: deviceSize.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.yellow,
                      Colors.orangeAccent,
                      Colors.deepOrangeAccent
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  )),
                  child: Center(child: _circularAvatar())),
            ),
            Text(currentSong.artistName),
            Text(currentSong.trackName),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.skip_previous,
                    size: 50,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 50,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    _play();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, size: 50),
                  onPressed: () {},
                )
              ],
            ),
            Text("Current is ${_positioned==null?0.0:_positioned?.inSeconds}"),
            Text("Duration is ${_duration==null?0.0:_duration?.inSeconds}")
          ],
        ),
      ),
    );
  }
}
