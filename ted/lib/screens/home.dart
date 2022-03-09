import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ted/repo/post_operations.dart';
import 'package:ted/models/post.dart';
import 'package:ted/widgets/cust_text.dart';
import 'package:ted/widgets/show.dart';

class home extends StatelessWidget {
  List<post> posts = [];
  home() {
    PostOperations opr = PostOperations.getInstance();
    posts = opr.getPost();
  }
  _getText(
      {required String text,
      Color color = Colors.white,
      FontWeight fontWeight = FontWeight.normal,
      double fontsize = 14}) {
    return Text(text,
        style: TextStyle(
            color: color, fontWeight: fontWeight, fontSize: fontsize));
  }

  List<Widget> _tedPost(Size deviceSize) {
    List<Widget> postList = posts.map((post) {
      return Card(
        child: Stack(
          children: [
            Image.network(post.post_image),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _getText(
                          text: post.post_author,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontsize: 14),
                      _getText(
                          text: post.post_name,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontsize: 16),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                      child:_getText(
                          text: post.post_time,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontsize: 12),
                      )
                    ],
                  )
                ],
              ),
              bottom: 8,
              left: 7,
              width: deviceSize.width - 20,
            ),
          ],
        ),
      );
    }).toList();
    return postList;
  }

  _getAppbar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Text("TED",
              style: GoogleFonts.poppins(
                  color: Colors.red, fontWeight: FontWeight.w900)),
          SizedBox(width: 8),
          Text(
            "Newest",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w400),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.red,
          )
        ],
      ),
      actions: [Icon(Icons.more_vert, color: Colors.red), SizedBox(width: 5)],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppbar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu_rounded, color: Colors.red),
                  Icon(Icons.play_lesson, color: Colors.grey),
                  Icon(Icons.headphones, color: Colors.grey),
                  Icon(Icons.lightbulb_outline, color: Colors.grey),
                  Icon(Icons.supervised_user_circle, color: Colors.grey)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
            child: Column(
              children: _tedPost(deviceSize),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: Icon(Icons.search),
      ),
    );
  }
}
