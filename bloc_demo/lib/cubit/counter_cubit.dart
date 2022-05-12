import 'package:bloc_demo/cubit/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//To create Cubit (Function Based) we need to extends Cubit
// class CounterCubit extends Cubit<int> {
class CounterCubit extends Cubit<CustomCubitState> {
  //Create a Parameterized Constructor
  //which take initialState Value and call the
  //parent class constructor
  // CounterCubit(int initialState) : super(initialState);
  CounterCubit(CustomCubitState initialState) : super(initialState);
  //Create Operations (Functions) call from the UI / Widget
  void plus() {
    //logic stuff or U are calling some other Logic (Service, Repository, Helpers)
    // emit(state + 1);
    emit(CustomCubitState(state.first + 1, state.second+2));
    //Fire the Event so Listener on Another Widget can listen the
  }
  //other operations like plus
}
