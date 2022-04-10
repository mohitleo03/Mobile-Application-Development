import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class toastMessage extends StatelessWidget {
  late String title;
  late String message;
  toastMessage({required String title, required String message}) {
    this.title = title;
    this.message = message;
  }

  @override
  Widget build(BuildContext context) {
    return Flushbar(
      title: title,
      message: message,
      duration: Duration(seconds: 2),
    )..show(context);
  }
}
