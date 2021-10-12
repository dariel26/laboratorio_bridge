import 'package:flutter/material.dart';
import 'components/body/body.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        title: const Text('Duodigito'),
      ),
      body: const BodyHomeContainer(),
    );
  }
}
