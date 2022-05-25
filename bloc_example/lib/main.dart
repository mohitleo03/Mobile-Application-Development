import 'package:bloc_example/cubit/CubitState.dart';
import 'package:bloc_example/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/counterapp.dart';

void main() {
  runApp(MaterialApp(
    // home: counter(),
    // home: BlocProvider(create: (context)=>CounterCubit(0),child: counter()),
    home: BlocProvider(create: (context)=>CounterCubit(CustomCubitState("mohit",1)),child: counter()),
  ));
}
