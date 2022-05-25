import 'package:bloc_example/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class operations extends StatelessWidget {
  const operations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterCubit cubit = BlocProvider.of<CounterCubit>(context);
    return Container(
      child: ElevatedButton(
          child: Text("+", style: TextStyle(fontSize: 20)),
          onPressed: () {
            cubit.plus(".",1);
          }),
    );
  }
}
