import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit() : super(2);


  void incrementBy(int number){
    emit(state + number);
  }

  void decrementBy(int number){
    emit(state - number);
  }

  void multiplyBy(int number){
    emit(state * number);
  }

  void divideBy(int number){
    emit(state ~/ number);
  }

  void powToSquare(){
    emit(state * state);
  }
}