import 'package:flutter/material.dart';
import 'package:universities/models/university.dart';
import 'package:url_launcher/url_launcher.dart';

class UniversityTile extends StatelessWidget {
  University university;
  UniversityTile(this.university);
  void _launchUrl(String URL) async {
    Uri url = Uri.parse(URL);
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          width: deviceSize.width - 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade500)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(university.name,
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 123, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              SizedBox(height: 10,),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "State",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black,fontSize: 16)),
                  TextSpan(
                      text: " - ${university.state_province}",
                      style: TextStyle(color: Colors.black,fontSize: 16))
                ]),
              ),
              SizedBox(height: 10,),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Country",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black,fontSize: 16)),
                  TextSpan(
                      text: " - ${university.country}",
                      style: TextStyle(color: Colors.black,fontSize: 16))
                ]),
              ),
              Row(
                
                children: [
                  Text("Website",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black,fontSize: 16)),
                  Text(" - "),
                  TextButton(
                      onPressed: () {
                        _launchUrl(university.web_pages[0]);
                      },
                      child: Text(university.web_pages[0],style: TextStyle(fontSize: 16),))
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
