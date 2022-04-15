import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class toastMessage extends StatelessWidget {
  late String title;
  late String message;
  late BuildContext context;
  toastMessage(
      {required String title,
      required String message,
      required BuildContext context}) {
    this.title = title;
    this.message = message;
    this.context = context;
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return Flushbar(
      title: title,
      message: message,
      duration: Duration(seconds: 2),
    )..show(this.context);
  }
}
