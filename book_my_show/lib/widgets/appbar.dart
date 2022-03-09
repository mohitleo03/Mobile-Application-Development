import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appbar extends StatelessWidget {
  late Icon leading_icon;
  late String text1;
  late Color bg1;
  late String text2;
  late Color bg2;
  late Icon action_icon;
  late Size deviceSize;
  appbar(
      {required Icon leading_icon,
      required String text1,
      required Color bg1,
      required String text2,
      required Color bg2,
      required Icon action_icon,
      required Size deviceSize}) {
    this.leading_icon = leading_icon;
    this.text1 = text1;
    this.bg1 = bg1;
    this.text2 = text2;
    this.bg2 = bg2;
    this.action_icon = action_icon;
    this.deviceSize = deviceSize;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:leading_icon,
      backgroundColor: Colors.black38,
      title: Row(
        children: [
          Container(
            width: deviceSize.width/5,
            height: 50,
            color: bg1,
            child: Text(text1,style: GoogleFonts.poppins()),
          ),
          Container(
            width: deviceSize.width/5,
            height: 50,
            color: bg2,
            child: Text(text2,style: GoogleFonts.poppins()),
          )
        ],
      ),
      actions: [
        action_icon
      ],
    );
  }
}




/*
appBar: AppBar(
        toolbarHeight: 70,
      leading:Icon(Icons.menu_rounded),
      backgroundColor: Color.fromARGB(255, 49, 49, 65),
      title: Container(
        width: deviceSize.width*2/3,
        child: Stack(
        children: [
          Positioned(child: 
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(255, 255, 66, 89)
              ),
              width: deviceSize.width/3,
              height: 45,
              child: Center(child: Text("NOW SHOWING",style: GoogleFonts.poppins(fontSize:15))),
            ),
            left: 0,
          ),
          Positioned(child: 
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(255, 81, 81, 97)
              ),
              width: deviceSize.width/3,
              height: 45,
              child: Center(child: Text("COMING SOON",style: GoogleFonts.poppins(fontSize:15))),
            ),
            right: 0,
          )
        ],
        ),
      ),
      actions: [
        Icon(Icons.location_on),SizedBox(width: 10,)
      ],
    ),
*/