import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import 'package:shopping_seller_app/utils/models/message.dart';
import '../models/user.dart' as UserClass;

class UserOperations {
  UserOperations._() {}
  static UserOperations _opr = UserOperations._();
  static UserOperations getInstance() {
    return _opr;
  }

  //step 1 - create an instance of firebase auth service
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  //register
  Future<Message> add(UserClass.User user) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: user.userid, password: user.password);
      Message message = Message.takeMessage(
          message: 'Register Successful', code: Constants.SUCCESS);
      print("$userCred");
      return message;
    } catch (err) {
      print("Error is $err");
      return Message.takeMessage(
          message: 'Register Fail', code: Constants.FAIL);
    }
  }

  //login
  Future<Message> read(UserClass.User user) async {
    try {
      QuerySnapshot users = await db.collection(Collections.USERS).get();
      List<String> userslist =
          users.docs.map((e) => e['email'].toString()).toList();
      if (userslist.contains(user.userid)) {
        return Message.takeMessage(
            message: 'Login Failed', code: Constants.FAIL);
      } else {
        UserCredential userCred = await _auth.signInWithEmailAndPassword(
            email: user.userid, password: user.password);
        print(userCred);
        return Message.takeMessage(
            message: 'Login Successful', code: Constants.SUCCESS);
      }
    } catch (e) {
      print("Error is $e");
      return Message.takeMessage(message: 'Login Fail', code: Constants.FAIL);
    }
  }

  //change password
  update() {}
  //account deactivate
  delete() {}
}
