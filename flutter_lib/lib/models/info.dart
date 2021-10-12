import 'package:duodigito/screens/home/components/body/cubits/body_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyInfoCubit, String>(builder: (context, state) {
      return Text(state, style: const TextStyle(color: Colors.red), maxLines: null,);
    });
  }
}
