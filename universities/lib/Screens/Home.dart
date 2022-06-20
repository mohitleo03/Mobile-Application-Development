import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universities/ViewModels/Home.dart';
import 'package:universities/models/university.dart';

import '../Provider/provider.dart';
import '../Provider/university_list_provider.dart';
import '../Widgets/university_tile.dart';

class Home extends StatelessWidget {
  HomeViewModel viewModel = HomeViewModel();
  List<University> universities = [
    University(
        domains: ["hsd"],
        web_pages: ["https://www.google.com"],
        state_province: "hgsdf",
        name: "name",
        country: "country",
        alpha_two_code: "alpha_two_code")
  ];
  List<String> countries = [
    'India',
    'china',
    'Bhutan',
    'Australia',
    'Italy',
    'Spain',
    'Sweden'
  ];
  String selectedValue = 'India';

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Universities',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 253, 231, 233),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Country Filter",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                height: 40,
                width: 180,
                child: Consumer(
                  builder: ((context, watch, child) {
                    final UniversityListController controller =
                        context.read(universityListProvider.notifier);
                    return DropdownButtonFormField2(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        isExpanded: true,
                        value: selectedValue,
                        hint: const Text(
                          '  Select Country',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: countries
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) async{
                          selectedValue = value.toString();

                          await controller.changeUniversityList(
                              viewModel.getUniversitiesList(selectedValue));
                        });
                  }),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // FutureBuilder(
          //     future: viewModel.getUniversitiesList(selectedValue),
          //     builder: ((context, snapshot) {
          //       ConnectionState state = snapshot.connectionState;
          //       if (state == ConnectionState.waiting) {
          //         return Center(child: CircularProgressIndicator());
          //       } else if (snapshot.hasError) {
          //         print("error is ${snapshot.error}");
          //         return Container();
          //       } else {
          // print(snapshot.data);
          // String str = snapshot.data.toString();
          // List<dynamic> mapList = jsonDecode(str);
          // List<University> list = viewModel.getUniversity(mapList);
          SingleChildScrollView(
            child: Container(
                height: deviceSize.height - 180,
                child: Consumer(builder: ((context, watch, child) {
                  final universityList = watch(universityListProvider);
                  return ListView.builder(
                      itemCount: universityList.length,
                      itemBuilder: ((context, index) {
                        return UniversityTile(universityList[index]);
                      }));
                }))),
          )
        ],
      ),
    );
  }
}
