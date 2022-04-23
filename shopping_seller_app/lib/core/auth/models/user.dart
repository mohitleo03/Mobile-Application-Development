class User {
  late String userid;
  late String password;
  User() {}
  User.takeInput(
      {required String userid,
      required String password}) {
    this.userid = userid;
    this.password = password;
  }
}