import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    Text("Registration", textAlign: TextAlign.center,style: TextStyle(fontSize: 30)),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Username", hintText: "Enter email"),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Password", hintText: "Enter Password"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {}, 
                      child: Text("Register")
                      )
                  ],
                ),
              ))),
    );
  }
}
