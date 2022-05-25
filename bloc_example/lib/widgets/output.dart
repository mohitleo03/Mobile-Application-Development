import 'package:bloc_example/cubit/CubitState.dart';
import 'package:bloc_example/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class output extends StatelessWidget {
  const output({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child:
        BlocBuilder<CounterCubit, CustomCubitState>(builder: (ctx, state) {
      return Text(
        "data is ${state.name} & ${state.age}",
        style: TextStyle(fontSize: 20),
      );
    }));
  }
}
