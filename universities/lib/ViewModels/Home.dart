import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Utils/ApiClient.dart';
import '../models/university.dart';

class UniversityNotifier extends ChangeNotifier {
  List<University> universityList = [];
  ApiClient API = ApiClient.getInstance();
  getUniversitiesList(String country) {
    Future<Response> response =
        API.get("http://universities.hipolabs.com/search?country=" + country);
    response.then((value) {
      List<dynamic> list = value.data;
      universityList = list.map((map) => University.FromJSON(map)).toList();
      notifyListeners();
    }).catchError((err) {
      print("error is $err");
      universityList = [];
      notifyListeners();
    });
  }
}

final universityProvider = ChangeNotifierProvider<UniversityNotifier>((ref) {
  return UniversityNotifier();
});
