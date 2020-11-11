import 'package:flutter/material.dart';
import 'package:hoop/components/table.dart';
import '../constant.dart';

class Bar extends StatelessWidget {
  final dynamic eastTable;
  final dynamic westTable;
  Bar({this.eastTable, this.westTable});
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConfTable(
            json: eastTable,
            teamIds: eastID,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConfTable(
            json: westTable,
            teamIds: westID,
          ),
        )
      ],
    );
  }
}
