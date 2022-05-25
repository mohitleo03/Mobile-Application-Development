import 'package:bloc_example/cubit/CubitState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class CounterCubit extends Cubit<int> {
//   CounterCubit(int initialState) : super(initialState);
//   void plus() {
//     emit(state + 1);
//   }
// }

class CounterCubit extends Cubit<CustomCubitState> {
  CounterCubit(CustomCubitState initialState) : super(initialState);
  void plus(name,int age) {
    emit(CustomCubitState(state.name+name,state.age + age));
  }
}