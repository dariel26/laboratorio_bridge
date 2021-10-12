import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MyButtomState {
  final Color color;
  final Color childColor;
  static Color isFocusColor = Colors.blueAccent;
  static Color isFocusChildColor = Colors.black;
  static Color isNotFocusColor = kIsWeb?Colors.black54:Colors.blueAccent;
  static Color isNotFocusChildColor = Colors.white;

  MyButtomState({required this.color, required this.childColor});
}