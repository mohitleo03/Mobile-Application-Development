import 'package:bloc_demo/cubit/counter_cubit.dart';
import 'package:bloc_demo/cubit/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Output extends StatelessWidget {
  const Output({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("object"); //build is not called on value change
    // return Container(
    //   child: BlocBuilder<CounterCubit, int>(builder: (ctx, state) {
    //     return Text(
    //       'Count value is $state',
    //       style: TextStyle(fontSize: 40),
    //     );
    //   }),
    // );
    return Container(
      child: BlocBuilder<CounterCubit, CustomCubitState>(builder: (ctx, state) {
        return Text(
          'Count value is ${state.first} & ${state.second}',
          style: TextStyle(fontSize: 40),
        );
      }),
    );
  }
}
