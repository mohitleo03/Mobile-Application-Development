// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';

// createToast(String msg, BuildContext ctx){
//   return Flushbar(
//             title: 'Shop app',
//             message:msg,
//             duration: Duration(seconds: 3),
//           ).show(ctx);
// }
import 'package:flutter/material.dart';
createToast(GlobalKey<ScaffoldState> scaffoldkey, String Message) {
    scaffoldkey.currentState?.showBottomSheet((context) {
      return Container(
        padding: EdgeInsets.only(left: 5,top: 5),
        width: double.infinity,
        height: 50,
        color: Colors.deepPurple,
        child: Text(Message,style: TextStyle(color: Colors.white,fontSize: 20)),
      );
    });
  }