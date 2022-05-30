import 'package:firebase_auth/firebase_auth.dart';

class Userdata{

  late String displayname;
  late String photourl;

  
  Userdata(String displayname , String photourl)
  {
    if(displayname!=null && photourl!=null)
    {
        this.displayname=displayname;
        this.photourl=photourl;
    }
  }

  
}