import 'package:duodigito/models/buttom/states/my_buttom_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyButtomCubit extends Cubit<MyButtomState> {
  MyButtomCubit(MyButtomState initialState) : super(initialState);

  void isFocus(context) {
    emit(
      MyButtomState(
        color: MyButtomState.isFocusColor,
        childColor: MyButtomState.isFocusChildColor,
      ),
    );
  }

  void isNotFocus(context) {
    emit(
      MyButtomState(
        color: MyButtomState.isNotFocusColor,
        childColor: MyButtomState.isNotFocusChildColor,
      ),
    );
  }
}