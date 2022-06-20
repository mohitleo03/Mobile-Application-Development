import 'package:flutter/material.dart';
import '/config/constants/AppConstants.dart';
import '/utils/widgets/custom_text.dart';
import '../../../utils/widgets/toast.dart';
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
    UserOperations opr = UserOperations.getInstance();
    Message messageObject = await opr.read(userObject);
    createToast(scaffoldkey, messageObject.message);
    if (messageObject.code == Constants.SUCCESS) {
      Future.delayed(Duration(milliseconds: 1000), () {
        Navigator.pushReplacementNamed(context, RouteConstants.DASHBOARD,
            arguments: {'userid': useridCtrl.text});
        // arguments: useridCtrl.text); //we can also send any other data type
      });
    } else {
      createToast(scaffoldkey, messageObject.message);
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

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldkey,
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
                  CustomText(
                      label: 'Type UserId here',
                      tc: useridCtrl,
                      prefixIcon: Icons.login),
                  CustomText(
                      label: 'Type Password here',
                      tc: passwordCtrl,
                      prefixIcon: Icons.password,
                      isObscureText: true),
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