import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import 'package:shopping_seller_app/core/auth/register/models/message.dart';
import '../models/user.dart' as UserClass;

class UserRegisterOperations {
  //step 1 - create an instance of firebase auth service
  final FirebaseAuth _auth = FirebaseAuth.instance;
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



  //change password
  update() {}
  //account deactivate
  delete() {}
}
