

import 'package:duodigito/screens/home/components/body/states/body_home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyWaitCubit extends Cubit<BodyWaitState> {
  BodyWaitCubit(BodyWaitState initialState) : super(initialState);

  void isCalculating() {
    emit(BodyWaitState(isCalculating: true));
  }

  void isNotCalculating() {
    emit(BodyWaitState(isCalculating: false));
  }
}

class BodyTableCubit extends Cubit<BodyTableState> {
  BodyTableCubit(BodyTableState initialState) : super(initialState);

  void setValues(List<String> duodigit, List<String> time, List<String> numbers){
    emit(BodyTableState(duodigit: duodigit, time: time, number: numbers));
  }
}

class BodyTextFieldValidateCubit extends Cubit<BodyTextFieldValidateState>{
  BodyTextFieldValidateCubit(BodyTextFieldValidateState initialState) : super(initialState);

  void isValid(){
    emit(BodyTextFieldValidateState(validate: true));
  }

  void isNotValid(){
    emit(BodyTextFieldValidateState(validate: false));
  }
}

class BodyInfoCubit extends Cubit<String>{
  BodyInfoCubit(String initialState) : super(initialState);

  void setValue(String info){
    emit(info);
  }
}