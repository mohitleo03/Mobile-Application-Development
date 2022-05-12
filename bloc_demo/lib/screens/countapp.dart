import 'package:bloc_demo/cubit/counter_cubit.dart';
import 'package:bloc_demo/widgets/operations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/output.dart';

class CountApp extends StatelessWidget {
  const CountApp({ Key? key }) : super(key: key);
  // BLOC Cubit, Get the instance of BLOC Cubit
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BLOC")),
      body: Column(children: [
        Output(),
        Operations()
      ],),
    );
  }
}