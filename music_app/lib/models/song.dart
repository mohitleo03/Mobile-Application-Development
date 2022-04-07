class Song {
  late String artistName; //Artist of the song
  late String trackName; //title of the song
  late String image; //image URL
  late String audio; //music audio URL
  bool isPlaying = false;
  Song(this.artistName, this.trackName, this.image, this.audio);
  //Manual Serialization and Deserialization
  //Serialization - Object to JSON Converison
  //Deserialization - JSON to Object Conversion
  Song.fromJSON(Map<String, dynamic> map) {
    artistName = map['artistName'];
    trackName = map['trackName'];
    image = map['artworkUrl100'];
    audio = map['previewUrl'];
  }
  toJSON() {
    return {
      "artistName": artistName,
      "trackName": trackName,
      "artworkUrl": image,
      "previewUrl": audio
    };
  }
  //to print meaningful object use toString
  @override
  String toString() {
    return "artistName : $artistName , trackName : $trackName , artworkUrl100: $image , previewUrl : $audio";
  }
}
