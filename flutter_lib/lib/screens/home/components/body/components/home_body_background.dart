import 'package:flutter/material.dart';

class BodyBackGround extends StatelessWidget {
  const BodyBackGround({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double backgroundHeight = constraints.maxHeight-20;
        final double backgroundWidth = constraints.maxWidth*.95;
        return Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white,
              width: _restrictWidth(backgroundWidth),
              height: backgroundHeight,
              child: Center(
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
  double _restrictWidth(double value) {
    if (value * .95 > 1000) {
      return 1000;
    } else {
      return value * .95;
    }
  }
}
