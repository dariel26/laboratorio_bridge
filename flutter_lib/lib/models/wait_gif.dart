import 'package:duodigito/screens/home/components/body/cubits/body_home_cubit.dart';
import 'package:duodigito/screens/home/components/body/states/body_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WaitGif extends StatelessWidget {
  const WaitGif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BodyWaitCubit, BodyWaitState>(builder: (context, state) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double maxHeight = constraints.maxHeight * .3;
          final double maxWidth = constraints.maxWidth * .3;
          return Column(
            children: [
              SizedBox(
                height: _restrictSize(height: maxHeight, width: maxWidth)[0],
                width: _restrictSize(height: maxHeight, width: maxWidth)[1],
                child: kIsWeb ? Image.network(
                  state.isCalculating
                      ? 'https://duodigitoapp.web.app/assets/assets/images/wait_gif.gif'
                      : 'https://duodigitoapp.web.app/assets/assets/images/wait_image.png',
                  fit: BoxFit.cover,
                ) : Image.asset(state.isCalculating
                    ? 'assets/images/wait_gif.gif'
                    : 'assets/images/wait_image.png',
                  fit: BoxFit.cover,),
              ),
            ],
          );
        },
      );
    });
  }

  List<double> _restrictSize({required double height, required double width}) {
    double newHeight = -1;
    double newWidth = -1;
    if (height < width) {
      newHeight = height;
    } else {
      newWidth = width;
    }
    if (newWidth != -1) {
      newHeight = height;
      if (newWidth / 2 < height) {
        newHeight = newWidth / 2;
      }
    } else {
      newWidth = width;
      if (newHeight * 2 < width) {
        newWidth = newHeight * 2;
      }
    }
    newWidth = newWidth < 250 ? 250 : newWidth;
    newHeight = newHeight < 125 ? 125 : newHeight;
    return [newHeight, newWidth];
  }
}
