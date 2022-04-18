import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String userEmail;
  late String userPass;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                    Text("Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30)),
                    TextFormField(
                      onChanged: (value) {
                        userEmail = value;
                      },
                      decoration: InputDecoration(
                          labelText: "Username", hintText: "Enter email"),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter apssword';
                        }
                      },
                      onChanged: (value) {
                        userPass = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password", hintText: "Enter Password"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () async{
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            try{  //!!!!! NOT WORKING
                              await _auth.createUserWithEmailAndPassword(
                                email: userEmail, password: userPass);
                            }on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print('The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                          }
                        },
                        child: Text("Register"))
                  ],
                ),
              ))),
    );
  }
}
