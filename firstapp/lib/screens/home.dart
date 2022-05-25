import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext bt) {
    return Scaffold(
      drawer: Drawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {},
        child :Text("+")
      ),
      appBar: AppBar(
        //leading: Icon(Icons.menu),
        actions: [
          Icon(
            Icons.phone,
            color: Colors.black,
          ),
          SizedBox(
            width: 30,
          ),
          Icon(Icons.message),
          SizedBox(width: 10)
        ],
        backgroundColor: Colors.redAccent,
        title: Text("Header"),
      ),
      backgroundColor: Colors.white,
      body:Hero(
        tag: "NatureImage",
        child: Container(
        width: 300,
        height: 300,
        
        // width: double.infinity,
        // height: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          //borderRadius: BorderRadius.circular(150),
          boxShadow: [BoxShadow(color: Colors.black ,blurRadius: 50),BoxShadow(color: Colors.blue,blurRadius: 30)],
          border: Border.all(width: 1,color: Colors.black,style: BorderStyle.solid),
          gradient: LinearGradient(
            colors: [Colors.red,Colors.green,Colors.blue],begin: Alignment.topLeft, end: Alignment.bottomRight
            ),
            
            ),
        child: Center(child: Text("Conatiner",style:TextStyle(fontSize: 30),)),
      ))
      //body: Image.network("https://upload.wikimedia.org/wikipedia/en/b/bd/Doraemon_character.png")
      // SafeArea(
      //     child: Center(
      //   child: Text(
      //     "In scaffold",
      //     style: TextStyle(backgroundColor: Colors.white, fontSize: 30),
      //   ),
      // )),
    );
  }
}
