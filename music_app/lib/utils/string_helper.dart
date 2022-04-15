  String reduceStringLength(String string, int length) {
    //function to reduce the length of content so that it won't look bad on screen
    String shortString = string;
    if (shortString.length > length) {
      shortString = shortString.substring(0, length) + "...";
    }
    return shortString;
  }