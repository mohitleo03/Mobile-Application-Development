import 'package:flutter/material.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import 'package:shopping_seller_app/core/auth/register/models/user.dart';
import 'package:shopping_seller_app/core/auth/register/services/user_operations.dart';

import '../../../../utils/animations/toast.dart';
import '../../register/models/message.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  moveToRegister() {
    Navigator.pushNamed(context, RouteConstants.REGISTER);
  }

  late TextEditingController useridCtrl;
  late TextEditingController passwordCtrl;

  _login() async{
    String userid = useridCtrl.text;
    String password = passwordCtrl.text;
    User userObject = User.takeInput(
        userid: userid, password: password, appId: Constants.appId);
    UserOperations opr = UserOperations();
    Message messageObject = await opr.read(userObject);
    createToast(messageObject.message, context);
    // Future.delayed(Duration(seconds: 3)
    // ,moveToRegister());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    useridCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(Constants.loginIcon),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: useridCtrl,
                decoration: InputDecoration(
                    hintText: 'Type UserId here',
                    prefix: Icon(Icons.login),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Type Password here',
                    prefix: Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        child: Text('Login'))),
                Container(
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          moveToRegister();
                        },
                        child: Text('Register'))),
              ],
            )
          ],
        ),
      )),
    );
  }
}
