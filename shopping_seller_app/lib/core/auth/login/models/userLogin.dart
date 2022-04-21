class UserLogin {
  late String userid;
  late String password;
  User() {}
  UserLogin.takeInput(
      {required String userid,
      required String password,}) {
    this.userid = userid;
    this.password = password;
  }
}