import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task2/Provider/contact_provider.dart';

final conatctListProvider =

    StateNotifierProvider((_) => ContactListController());