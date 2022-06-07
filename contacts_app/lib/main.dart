import 'package:contacts_app/cubit/contact_list_state.dart';
import 'package:contacts_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/contact_list_cubit.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(create: (context) => ContactListCubit(ContactListState([])), child: Home()),
  ));
}
