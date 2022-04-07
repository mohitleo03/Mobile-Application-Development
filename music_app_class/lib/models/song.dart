class Song {
  late String artistName; //artist of the song
  late String trackName; //song name
  late String image; //image URL
  late String audio; //song URL
  bool isPlaying = false;
  Song(this.artistName, this.trackName, this.image, this.audio);
  //Manual Serialization & DeSerialization
  //Serialization - Object to Json Conversion
  //Deserialization - Json to Object Conversion
  //Named Constructor
  Song.fromJSON(Map<String, dynamic> map) {
    artistName = map['artistName'];
    trackName = map['trackName'];
    image = map['artworkUrl100'];
    audio = map['previewUrl'];
  }
  Map<String, dynamic> toJSON() {
    return {
      "artistName": artistName,
      "trackName": trackName,
      "artworkUrl100": image,
      "previewUrl": audio
    };
  }

  @override
  String toString() {
    return "artistName $artistName TrackName $trackName";
  }
}
