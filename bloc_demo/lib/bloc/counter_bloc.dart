import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MathEvent {}

class PlusEvent extends MathEvent {}

class MinusEvent extends MathEvent {}

class CounterBloc extends Bloc<MathEvent, OperationState> {
  
}
