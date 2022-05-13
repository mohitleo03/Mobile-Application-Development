import 'package:bloc_demo/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Operations extends StatelessWidget {
  const Operations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterCubit cubit = BlocProvider.of<CounterCubit>(context);
    return Column(
      children: [
        ElevatedButton(
          child: Text("Cubit Plus"),
          onPressed: () {
            //call Cubit
            cubit.plus();
          },
        ),
        ElevatedButton(
          child: Text("Bloc Plus"),
          onPressed: () {
            
          },
        )
      ],
    );
  }
}
