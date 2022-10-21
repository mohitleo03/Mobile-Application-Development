import 'package:budgetmanager/modules/homepage/service/homepage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage();
  final logineduser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                      radius: (52),
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network("${logineduser.photoURL}"),
                          )
                        )
                      ),
              
              Padding(padding: EdgeInsets.fromLTRB(105, 20, 0, 0), child: Text("${logineduser.displayName}" , style: GoogleFonts.roboto(fontSize: 20 , fontWeight: FontWeight.bold),)),
              Padding(padding: EdgeInsets.fromLTRB(45, 0, 0, 0), child: Text("${logineduser.email}" , style: GoogleFonts.roboto(fontSize: 20),)),
              ListTile()
            ],
          ),
        ),
        appBar: AppBar( title: Text("BUDGET MANAGER" , style: GoogleFonts.breeSerif()),
          
        
        ));
  }
}
