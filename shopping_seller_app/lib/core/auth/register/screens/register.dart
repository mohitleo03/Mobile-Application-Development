import 'package:flutter/material.dart';

import '../../../../config/constants/AppConstants.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  moveToLogin() {
    Navigator.pushNamed(context, RouteConstants.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text('Register'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_LXC_AYa_L-un_DWQKmzOiOcsGI1Qwi491Q&usqp=CAU'),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Type UserId here',
                    prefix: Icon(Icons.app_registration),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
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
                        onPressed: () {}, child: Text('Register'))),
                Container(
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          moveToLogin();
                        },
                        child: Text('Login'))),
              ],
            )
          ],
        ),
      )),
    );
  }
}
