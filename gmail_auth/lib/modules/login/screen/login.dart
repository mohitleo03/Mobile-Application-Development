import 'package:budgetmanager/modules/homepage/screen/homepage.dart';
import 'package:budgetmanager/modules/homepage/service/homepage_data.dart';
import 'package:budgetmanager/modules/login/model/LoginModel.dart';
import 'package:budgetmanager/provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  bool _isobscure = true;
  late final logineduser = FirebaseAuth.instance.currentUser;
  TextEditingController usertc = TextEditingController();
  TextEditingController passtc = TextEditingController();
  late String _user;
  late String _pass;
  _takeValues() {
    _user = usertc.text;
    _pass = usertc.text;
    LoginModel(username: _user, password: _pass);
  }
  _toNavigate(context){
  Future.delayed(Duration(seconds: 1), () {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Colors.blue.shade50,
            Colors.blue.shade100,
            Colors.blue.shade200,
            Colors.blue.shade300,
            Colors.blue.shade400,
            Colors.blue.shade500
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //backgroundImage: LinearGradient(begin: Alignment.topLeft , end: Alignment.bottomRight , colors: [Colors.blue , Colors.red] ),
        appBar: AppBar(
          title: Center(
              child: Text("Budget Manager",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)))),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent),
                width: deviceSize.width,
              ),
            ),
            Positioned(
                top: 45,
                left: 150,
                child: Text("Login",
                    style: GoogleFonts.farro(
                        textStyle: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)))),
            Positioned(
                top: 130,
                left: 33,
                width: deviceSize.width - 70,
                child: TextField(
                  decoration: InputDecoration(
                      label: Text("Enter Username "),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                              style: BorderStyle.solid)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 3.0))),
                )),
            Positioned(
                top: 220,
                left: 33,
                width: deviceSize.width - 70,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      label: Text("Enter Password "),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade300,
                              width: 2.0,
                              style: BorderStyle.solid)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 3.0))),
                )),
            Positioned(
                top: 330,
                left: 86,
                width: 200,
                height: 45,
                child: ElevatedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () => _takeValues(),
                )),
            Positioned(
                width: deviceSize.width - 65,
                left: 30,
                bottom: 190,
                height: 50,
                child: SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                        provider.googleLogin();
                        //Userdata(FirebaseAuth.instance.currentUser.displayName , FirebaseAuth.instance.currentUser.photoURL);
                        _toNavigate(context , );
                        
                        
                        
                  },
                  elevation: 10.0,
                )),
            
            
          ],
        ),
      ),
    );
  }
}
