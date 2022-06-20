import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:universities/Utils/ApiClient.dart';
import 'package:universities/models/university.dart';

class HomeViewModel {
  ApiClient API = ApiClient.getInstance();
  getUniversitiesList(String country) async{
    Response response =
        await API.get("http://universities.hipolabs.com/search?country=" + country);
      List<dynamic> list = response.data;
      List<University> universityList =
          list.map((map) => University.FromJSON(map)).toList();
      return universityList;
   
    // return response;
  }

  // List<University> getUniversity(dynamic mapList) {
  //   mapList = mapList.toString();
  //   var json = jsonDecode(mapList);
  //   print(json);
  //   List<University> list =
  //       json.map((university) => University.FromJSON(university)).toList();
  //   return list;
  // }
}
