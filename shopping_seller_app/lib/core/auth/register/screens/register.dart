import 'package:flutter/material.dart';
import 'package:shopping_seller_app/core/auth/register/services/user_register_operations.dart';
import 'package:shopping_seller_app/utils/animations/toast.dart';

import '../../../../config/constants/AppConstants.dart';
import '../../../../utils/services/message.dart';
import '../models/user.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _moveToLogin() {
    Navigator.pushReplacementNamed(context, RouteConstants.LOGIN);
  }

  _register() async {
    String message = '';
    String userid = useridCtrl.text;
    String password = passwordCtrl.text;
    String appId = appidCtrl.text;
    if (appId != Constants.appId) {
      message = 'Wrong App Id';
      createToast(message, context);
    } else {
      User userObject =
          User.takeInput(userid: userid, password: password, appId: appId);
      UserRegisterOperations opr = UserRegisterOperations();
      Message messageObject = await opr.add(userObject);
      createToast(messageObject.message, context);
      Future.delayed(Duration(seconds: 3), _moveToLogin);
    }
  }

  late TextEditingController useridCtrl;
  late TextEditingController passwordCtrl;
  late TextEditingController appidCtrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    useridCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    appidCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: deviceSize.height - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.network(Constants.REGISTRATION_IMAGE,height: 250,),
                  Container(
                    margin: EdgeInsets.all(8), 
                    child: TextField(
                      controller: useridCtrl,
                      decoration: InputDecoration(
                          hintText: 'Type UserId here',
                          prefix: Icon(Icons.app_registration),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
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
                  Container(
                    margin: EdgeInsets.all(8),
                    child: TextField(
                      controller: appidCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Type App Id here',
                          prefix: Icon(Icons.password),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    width: 200,
                      margin: EdgeInsets.all(3),
                      child: ElevatedButton(
                          onPressed: () {
                            _register();
                          },
                          child: Text('Register'))),
                ],
              ),
              Column(
                children: [
                  Text('If you are an existing Seller you should Login'),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          _moveToLogin();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.blue),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                      )),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
