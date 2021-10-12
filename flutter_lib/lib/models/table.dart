import 'package:duodigito/screens/home/components/body/cubits/body_home_cubit.dart';
import 'package:duodigito/screens/home/components/body/states/body_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTableData extends StatelessWidget {
  const MyTableData({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BodyTableCubit, BodyTableState>(
        builder: (context, state) {
      return DataTable(
        columnSpacing: 15,
        columns: [
          DataColumn(
              label: Text(
                'Número',
                style: _myStyle(),
              )),
          DataColumn(
              label: Text(
            'Duodigito',
            style: _myStyle(),
          )),
          DataColumn(
              label: Text(
            'Tempo do cálculo (Servidor)',
            style: _myStyle(),
          )),
        ],
        rows: _rows(values: state.duodigit, timers: state.time, numbers: state.number),
      );
    });
  }

  List<DataRow> _rows(
      { required List<String> values,required List<String> timers, required List<String> numbers}) {
    List<DataRow> list = [];
    for (int i = 0; i < values.length; i++) {
      list.add(
        DataRow(
          cells: [
            DataCell(
              Text(numbers[i], style: _myStyle(),),
              placeholder: true,
            ),
            DataCell(
              Text(values[i], style: _myStyle(),),
              placeholder: true,
            ),
            DataCell(
              Text(timers[i], style: _myStyle(),),
              placeholder: true,
            )
          ],
        ),
      );
    }
    list = List.from(list.reversed);
    return list;
  }

  TextStyle _myStyle(){
    return TextStyle(fontSize: _fontSize(width*.06));
  }

  double _fontSize(double value) {
    return value > 15.9
        ? 15.9
        : value <= 10
            ? 10
            : value;
  }
}
