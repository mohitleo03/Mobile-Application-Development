import 'package:firstapp/screens/animatedContainer.dart';
import 'package:firstapp/screens/appbar.dart';
import 'package:firstapp/screens/circle_avatar.dart';
import 'package:firstapp/screens/circle_img.dart';
import 'package:firstapp/screens/columns.dart';
import 'package:firstapp/screens/cont.dart';
import 'package:firstapp/screens/flexible_widget.dart';
import 'package:firstapp/screens/hero_widget.dart';
import 'package:firstapp/screens/home.dart';
import 'package:firstapp/screens/intro_screen.dart';
import 'package:firstapp/screens/linear_grad.dart';
import 'package:firstapp/screens/local_img.dart';
import 'package:firstapp/screens/net_img.dart';
import 'package:firstapp/screens/one.dart';
import 'package:firstapp/screens/pageView.dart';
import 'package:firstapp/screens/radial_grad.dart';
import 'package:firstapp/screens/rich_text.dart';
import 'package:firstapp/screens/row.dart';
import 'package:firstapp/screens/scaff.dart';
import 'package:firstapp/screens/stack_demo.dart';
import 'package:firstapp/screens/stateful_demo.dart';
import 'package:firstapp/screens/sweep_grad.dart';
import 'package:firstapp/screens/temp.dart';
import 'package:firstapp/screens/temp2.dart';
import 'package:firstapp/screens/textBox.dart';
import 'package:firstapp/screens/textbox_controller.dart';
import 'package:firstapp/screens/transform_rotate.dart';
import 'package:firstapp/screens/visibility.dart';
import 'package:firstapp/screens/wrapping.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // systemChrome.
    debugShowCheckedModeBanner: false,
    //home: one()
    //home: scaff()
    //home: appbar()
    //home: net_img()
    //home: local_img(),
    //home : cont()
    //home: circle_img(),
    //home: circle_avatar(),
    //home: liner_grad(),
    //home: radial_grad(),
    //home: sweep_grad(),
    //home: transform_rotate(),
    //home: rows(),
    //home: columns(),
    //home: stack_demo(),
    //home: home(),
    //home: temp(),

    //Stateful widget - 
    //home: stateful_demo(),
    //home: textBox(),
    // home: textbox_controller(),
    // home: IntroScreen(),
    // home: RichTextExample(),
    // home: flexibleWidget(),
    // home: wrapWidget(),
    // home: visibility(),
    // home: temp2(),
    // home: heroWidget(),
    // home: Animatedcontainer(),
    home: pageView(),

  ));
}
