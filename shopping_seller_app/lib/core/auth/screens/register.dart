import 'package:flutter/material.dart';
import 'package:shopping_seller_app/core/auth/services/user_operations.dart';
import 'package:shopping_seller_app/utils/widgets/toast.dart';
import '../../../../config/constants/AppConstants.dart';
import '../../../modules/widgets/custom_text.dart';
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
        Future.delayed(Duration(milliseconds: 1500), () {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.network(
                    Constants.REGISTRATION_IMAGE,
                    height: 250,
                  ),
                  CustomText(label: 'Type UserId here',tc: useridCtrl,prefixIcon: Icons.app_registration),
                  CustomText(label: 'Type Password here',tc: passwordCtrl,prefixIcon: Icons.password,isObscureText: true),
                  CustomText(label: 'Type AppId here',tc: appidCtrl,prefixIcon: Icons.password,isObscureText: true),
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
