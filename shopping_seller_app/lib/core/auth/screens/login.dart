import 'package:flutter/material.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import '../../../../utils/animations/toast.dart';
import '../../../utils/models/message.dart';
import '../models/user.dart';
import '../services/user_operations.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  _moveToRegister() {
    Navigator.pushReplacementNamed(context, RouteConstants.REGISTER);
  }

  late TextEditingController useridCtrl;
  late TextEditingController passwordCtrl;

  _login() async {
    String userid = useridCtrl.text;
    String password = passwordCtrl.text;
    User userObject = User.takeInput(userid: userid, password: password);
    UserOperations opr = UserOperations();
    Message messageObject = await opr.read(userObject);
    createToast(messageObject.message, context);
    if (messageObject.code == Constants.SUCCESS) {
      Future.delayed(Duration(milliseconds:1500), () {
              Navigator.pushNamed(context, RouteConstants.DASHBOARD,
          arguments: {'userid': useridCtrl.text});
      });

    } else {
      createToast(messageObject.message, context);
    }
    passwordCtrl.clear();
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
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: deviceSize.height - 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Image.network(Constants.LOGIN_IMAGE),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: useridCtrl,
                      decoration: InputDecoration(
                          hintText: 'Type UserId here',
                          prefixIcon: Icon(Icons.login),
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
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                      width: 200,
                      margin: EdgeInsets.all(5),
                      child: ElevatedButton(
                          onPressed: () {
                            _login();
                          },
                          child: Text('Login'))),
                ],
              ),
              Column(
                children: [
                  Text('If you are a new Seller you can Register'),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          _moveToRegister();
                        },
                        child: Text(
                          'Register',
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
