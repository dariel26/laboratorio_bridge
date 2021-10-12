class BodyWaitState {
  bool isCalculating;

  BodyWaitState({required this.isCalculating});
}

class BodyTableState {
  List<String> duodigit;
  List<String> time;
  List<String> number;
  BodyTableState({required this.duodigit, required this.time, required this.number});
}

class BodyTextFieldValidateState{
  bool validate;
  BodyTextFieldValidateState({required this.validate});
}