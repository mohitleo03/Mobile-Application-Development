class UserRegister {
  late String userid;
  late String password;
  late String appId;
  UserRegister() {}
  UserRegister.takeInput(
      {required String userid,
      required String password,
      required String appId}) {
    this.userid = userid;
    this.password = password;
    this.appId = appId;
  }
}