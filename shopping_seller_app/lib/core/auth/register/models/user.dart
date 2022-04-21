class User {
  late String userid;
  late String password;
  late String appId;
  User() {}
  User.takeInput(
      {required String userid,
      required String password,
      required String appId}) {
    this.userid = userid;
    this.password = password;
    this.appId = appId;
  }
}
