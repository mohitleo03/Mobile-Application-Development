import 'package:firebase_auth/firebase_auth.dart';
import '../../../../config/constants/AppConstants.dart';
import '../../login/models/userLogin.dart' as UserClass;
import '../../../../utils/services/message.dart';

class UserLoginOperations{
    //step 1 - create an instance of firebase auth service
  final FirebaseAuth _auth = FirebaseAuth.instance;
    //login
  Future<Message> read(UserClass.UserLogin user) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: user.userid, password: user.password);
      return Message.takeMessage(
          message: 'Login Successful', code: Constants.SUCCESS);
    } catch (e) {
      print("Error is $e");
      return Message.takeMessage(message: 'Login Fail', code: Constants.FAIL);
    }
  }
}