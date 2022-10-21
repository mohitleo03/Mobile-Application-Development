import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../ViewModels/Home.dart';
import '../Widgets/university_tile.dart';
import '../models/university.dart';

class Home extends ConsumerWidget {
  bool firstLoad = true;
  bool loading = true;
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
  Widget build(BuildContext context, WidgetRef ref) {
    Size deviceSize = MediaQuery.of(context).size;
    List<University> universities =
        ref.watch(universityProvider).universityList;
    if (firstLoad) {
      ref.read(universityProvider.notifier).getUniversitiesList(selectedValue);
      firstLoad = false;
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Universities',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 98, 203, 255),
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
                  child: DropdownButtonFormField2(
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
                      onChanged: (value) {
                        selectedValue = value.toString();
                        ref
                            .read(universityProvider.notifier)
                            .getUniversitiesList(selectedValue);
                      }))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
              child: Container(
                  height: deviceSize.height - 180,
                  child: ListView.builder(
                      itemCount: universities.length,
                      itemBuilder: ((context, index) {
                        return UniversityTile(universities[index]);
                      })))),
        ],
      ),
    );
  }
}
