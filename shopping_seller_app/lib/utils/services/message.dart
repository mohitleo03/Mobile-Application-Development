class Message {
  late String message;
  late int code;
  Message() {}
  Message.takeMessage({required String message, required int code}) {
    this.message = message;
    this.code = code;
  }
}
