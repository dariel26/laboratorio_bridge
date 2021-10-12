import 'package:duodigito/funtions/calculate.dart';
import 'package:duodigito/models/buttom/buttom.dart';
import 'package:duodigito/models/info.dart';
import 'package:duodigito/models/table.dart';
import 'package:duodigito/models/text_field.dart';
import 'package:duodigito/models/wait_gif.dart';
import 'package:duodigito/screens/home/components/body/states/body_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/home_body_background.dart';
import 'cubits/body_home_cubit.dart';

class BodyHomeContainer extends StatelessWidget {
  const BodyHomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BodyWaitCubit(
            BodyWaitState(isCalculating: false),
          ),
        ),
        BlocProvider(
          create: (_) => BodyTableCubit(
            BodyTableState(duodigit: [], time: [], number: []),
          ),
        ),
        BlocProvider(
          create: (_) => BodyTextFieldValidateCubit(
            BodyTextFieldValidateState(validate: true),
          ),
        ),
        BlocProvider(
          create: (_) => BodyInfoCubit(''),
        ),
      ],
      child: const BodyHome(),
    );
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return BodyBackGround(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Info(),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: WaitGif(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _restrictWidth(constraints.maxWidth),
                    child: MyTextField(
                      controller: controller,
                      prefixIcon: const Icon(Icons.pin),
                      hintText: 'Digite um número real',
                      onComplete: () {
                        BlocProvider.of<BodyWaitCubit>(context).isCalculating();
                        DuodigitCalculate(context: context).calculate(
                          controller: controller,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: MyButtomContainer(
                      data: 'Calcular',
                      onPressed: () {
                        DuodigitCalculate(context: context)
                            .calculate(controller: controller);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: MyTableData(
                  width: constraints.maxWidth * .3,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  double _restrictWidth(double value) {
    if (value * .5 > 400) {
      return 400;
    } else {
      return value * .5;
    }
  }
}
