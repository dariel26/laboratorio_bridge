

import 'package:duodigito/screens/home/components/body/cubits/body_home_cubit.dart';
import 'package:duodigito/screens/home/components/body/states/body_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    this.isFocus = false,
    required this.prefixIcon,
    this.hintText = 'Digite aqui',
    required this.onComplete,
  }) : super(key: key);

  final TextEditingController controller;
  final bool isFocus;
  final Icon prefixIcon;
  final String hintText;
  final Function onComplete;

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
    );
    return BlocBuilder<BodyTextFieldValidateCubit, BodyTextFieldValidateState>(
      builder: (context, state) {
        return TextField(
          controller: controller,
          autofocus: isFocus,
          keyboardType: TextInputType.number,
          cursorColor: Theme.of(context).primaryColor,
          onEditingComplete: (){
            onComplete();
          },
          decoration: InputDecoration(

            hintText: hintText,
            prefixIcon: prefixIcon,
            errorText: state.validate?null:'Somente números reais são aceitos',
            focusColor: Theme.of(context).primaryColor,
            focusedBorder: border,
            border: border,
          ),
        );
      }
    );
  }
}
