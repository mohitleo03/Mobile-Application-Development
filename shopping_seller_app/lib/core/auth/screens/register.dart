import 'package:flutter/material.dart';
import 'package:shopping_seller_app/core/auth/services/user_operations.dart';
import 'package:shopping_seller_app/utils/widgets/toast.dart';
import '../../../../config/constants/AppConstants.dart';
import '../../../utils/widgets/custom_text.dart';
import '../../../utils/models/message.dart';
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
      User userObject = User.takeInput(userid: userid, password: password);
      UserOperations opr = UserOperations.getInstance();
      Message messageObject = await opr.add(userObject);
      createToast(messageObject.message, context);
      if (messageObject.code == Constants.SUCCESS) {
        Future.delayed(Duration(milliseconds: 1000), () {
          _moveToLogin();
        });
      }
      passwordCtrl.clear();
      appidCtrl.clear();
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.network(
                    Constants.REGISTRATION_IMAGE,
                    height: 250,
                  ),
                  CustomText(
                      label: 'Type UserId here',
                      tc: useridCtrl,
                      prefixIcon: Icons.app_registration),
                  CustomText(
                      label: 'Type Password here',
                      tc: passwordCtrl,
                      prefixIcon: Icons.password,
                      isObscureText: true),
                  CustomText(
                      label: 'Type AppId here',
                      tc: appidCtrl,
                      prefixIcon: Icons.password,
                      isObscureText: true),
                  Container(
                      width: 200,
                      margin: EdgeInsets.all(3),
                      child: ElevatedButton(
                          onPressed: () {
                            _register();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              minimumSize: Size(200, 45)),
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 20),
                          ))),
                ],
              ),
              Column(
                children: [
                  const Text('If you are an existing Seller you should Login'),
                  Container(
                      margin: EdgeInsets.only(top: 10,bottom: 25),
                      child: ElevatedButton(
                        onPressed: () {
                          _moveToLogin();
                        },
                        child: const Text(
                          'Login',
                          style:
                              TextStyle(color: Colors.deepPurple, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, minimumSize: Size(200, 45)),
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
