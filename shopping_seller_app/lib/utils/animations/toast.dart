import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

createToast(String msg, BuildContext ctx) async{
  return await Flushbar(
            title: 'Shop app',
            message:msg,
            duration: Duration(seconds: 3),
          ).show(ctx);
}