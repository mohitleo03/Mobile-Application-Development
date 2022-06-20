import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universities/models/university.dart';

class UniversityListController extends StateNotifier<List<University>> {
  UniversityListController() : super([]);

  changeUniversityList(List<University> list) {
    state = list;
  }
}
