
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_store/cubit/cartState.dart';

//To create Cubit (Function Based) we need to extends Cubit
// class CounterCubit extends Cubit<int> {
class CartItemCubit extends Cubit<cartState> {
  //Create a Parameterized Constructor
  //which take initialState Value and call the
  //parent class constructor
  // CounterCubit(int initialState) : super(initialState);
  CartItemCubit(cartState initialState) : super(initialState);
  //Create Operations (Functions) call from the UI / Widget
  void plus(int item, amount) {
    //logic stuff or U are calling some other Logic (Service, Repository, Helpers)
    // emit(state + 1);
    emit(cartState(state.count + item, state.price + amount));
    //Fire the Event so Listener on Another Widget can listen the
  }
  //other operations like plus
}
