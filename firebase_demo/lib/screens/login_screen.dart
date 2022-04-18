import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String userEmail;
  late String userPass;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20),
                    Text("Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30)),
                    TextField(
                      onChanged: (value) {
                        userEmail = value;
                      },
                      decoration: InputDecoration(
                          labelText: "Username", hintText: "Enter email"),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      onChanged: (value) {
                        userPass = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password", hintText: "Enter Password"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: () {

                    }, 
                    child: Text("Login"))
                  ],
                ),
              ))),
    );
  }
}
