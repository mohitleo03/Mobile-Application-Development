import 'package:book_my_show/models/movie.dart';
import 'package:book_my_show/repo/movie_operations.dart';
import 'package:book_my_show/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class home extends StatelessWidget {
  List<movie> movie_list = [];
  home() {
    movie_operations opr = movie_operations();
    movie_list = opr.getMovies();
  }

  List<Widget> _prepare_movie_card() {
    List<Widget> list = movie_list.map((movie) {
      double vote_percentage = movie.movie_percentage_votes;
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Card(
          child: Column(
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                Image.network(movie.movie_image),
                Positioned(
                  bottom: 12,
                  left: 5,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        movie.movie_certificate,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(174, 34, 34, 34),
                        border: Border.all(width: 2, color: Colors.white)),
                  ),
                ),
                // Container(
                //   color: Color.fromARGB(255, 7, 218, 77),
                //   padding: EdgeInsets.fromLTRB(12,6,12,6),
                //   child: Text("New",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400)),
                // ),
                Positioned(
                  bottom: 0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Color.fromARGB(255, 7, 218, 77),
                    child: Text(
                      "New",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(174, 34, 34, 34)),
                    height: 65,
                    width: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Color.fromARGB(255, 255, 66, 89),
                            ),
                            Text(
                              "  ${movie.movie_percentage_votes}" + "%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(height: 7),
                        Text(
                          movie.movie_votes.toString() + " votes",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.movie_name,
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  movie.movie_language,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 163, 163, 163)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 163, 163, 163))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(movie.movie_dimensions),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 255, 66, 89)),
                      ),
                      onPressed: () {
                        
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "BOOK",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(

      //appbar can't be called like this, its not a simple stateless widget
      // appBar: appbar(
      //   leading_icon: Icons.menu,
      //   text1: "NOW SHOWING",
      //   bg1: Colors.redAccent,
      //   text2: "COMMING SOON",
      //   bg2: Colors.black54,
      //   action_icon: Icons.location_on,
      //   deviceSize: deviceSize
      //   ),
      
      appBar: AppBar(
        //bottom: PreferredSizeWidget.scaffold(),
        toolbarHeight: 70,
        leading: Icon(Icons.menu_rounded),
        backgroundColor: Color.fromARGB(255, 49, 49, 65),
        title: Center(
          child: Container(
            width: deviceSize.width * 2 / 3,
            child: Stack(
              children: [
                
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 81, 81, 97)),
                    width: deviceSize.width / 3,
                    height: 40,
                    child: Center(
                        child: Text("COMING SOON",
                            style: GoogleFonts.poppins(fontSize: 15))),
                  ),
                  left: 116,
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 255, 66, 89)),
                    width: deviceSize.width / 3,
                    height: 40,
                    child: Center(
                        child: Text("NOW SHOWING",
                            style: GoogleFonts.poppins(fontSize: 15))),
                  ),
                )
                ],
            ),
          ),
        ),
        actions: [
          Icon(Icons.location_on),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 0,
      ),
      body: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.language,
                          color: Color.fromARGB(255, 29, 236, 243)),
                      SizedBox(width: 15),
                      Text("All Languages",
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108),
                              fontWeight: FontWeight.w500,
                              fontSize: 16))
                    ],
                  )),
              Text(
                "|",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(225, 236, 236, 236)),
              ),
              FlatButton(
                  onPressed: () {},
                  child: Row(children: [
                    Icon(Icons.chair, color: Colors.redAccent),
                    SizedBox(width: 15),
                    Text("Cinemas",
                        style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                            fontWeight: FontWeight.w500,
                            fontSize: 16))
                  ]))
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black12,
            child: Column(
              children: _prepare_movie_card(),
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 223, 223, 223),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Just For You"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "My Profile"),
        ],
      ),
    );
  }
}
