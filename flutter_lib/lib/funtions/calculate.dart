import 'package:duodigito/screens/home/components/body/cubits/body_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DuodigitCalculate {
  DuodigitCalculate({required this.context});

  final BuildContext context;

  void calculate({
    required TextEditingController controller,
  }) async {
    double? number = double.tryParse(controller.text.trim());
    if (number != null) {
      try {
        BlocProvider.of<BodyTextFieldValidateCubit>(context).isValid();
        BlocProvider.of<BodyWaitCubit>(context).isCalculating();
      } catch (_) {}

      _comunicate(numberQuery: number.toString());
      controller.text = '';
    } else {
      controller.text = '';
        BlocProvider.of<BodyTextFieldValidateCubit>(context).isNotValid();
        BlocProvider.of<BodyWaitCubit>(context).isNotCalculating();
    }
  }

  void _comunicate({required String numberQuery}) async {
    var url = Uri.parse('https://duodigitoapi.herokuapp.com/');
    try {
      await http.post(
        url,
        body: {'number': numberQuery},
        headers: {"Access-Control_Allow_Origin": "*"},
      ).timeout(const Duration(seconds: 40)).then((value) {
        if (value.statusCode == 200) {
            final List<String> values =
                BlocProvider.of<BodyTableCubit>(context).state.duodigit;
            final List<String> timers =
                BlocProvider.of<BodyTableCubit>(context).state.time;
            final List<String> numbers =
                BlocProvider.of<BodyTableCubit>(context).state.number;
            values.add(json.decode(value.body)["value"]);
            timers.add(json.decode(value.body)["timer"]);
            numbers.add(numberQuery);
            BlocProvider.of<BodyTableCubit>(context)
                .setValues(values, timers, numbers);
            BlocProvider.of<BodyWaitCubit>(context).isNotCalculating();
            BlocProvider.of<BodyInfoCubit>(context)
                .setValue('');
        }
      });
    } catch (_) {
      BlocProvider.of<BodyInfoCubit>(context)
          .setValue('Parece que você está desconectado.');
      BlocProvider.of<BodyWaitCubit>(context).isNotCalculating();
    }
  }
}
