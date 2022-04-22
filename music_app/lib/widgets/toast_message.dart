import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

toastMessage({required String title, required String message, required BuildContext context}) async {
  return await Flushbar(
    title: title,
    message: message,
    duration: Duration(seconds: 3),
  ).show(context);
}
