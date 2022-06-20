import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'university_list_provider.dart';

final universityListProvider =

    StateNotifierProvider((_) => UniversityListController());