

import 'package:duodigito/models/buttom/states/my_buttom_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/my_buttom_cubit.dart';

class MyButtomContainer extends StatelessWidget {
  const MyButtomContainer({Key? key, required this.data, required this.onPressed}) : super(key: key);

  final String data;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyButtomCubit(
        MyButtomState(
          color: MyButtomState.isNotFocusColor,
          childColor: MyButtomState.isNotFocusChildColor,
        ),
      ),
      child: MyButtom(data: data, onPressed: onPressed,),
    );
  }
}

class MyButtom extends StatelessWidget {
  const MyButtom({Key? key, required this.data, required this.onPressed}) : super(key: key);

  final String data;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyButtomCubit, MyButtomState>(
      builder: (context, state) {
        return InkWell(
          onTap: (){
            onPressed();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: MouseRegion(
              onHover: (event) {
                try{
                  BlocProvider.of<MyButtomCubit>(context).isFocus(context);
                }catch(_){}
              },
              onExit: (event) {
                try{
                  BlocProvider.of<MyButtomCubit>(context).isNotFocus(context);
                }catch(_){}

              },
              child: Container(
                color: state.color,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      data,
                      style: TextStyle(color: state.childColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
