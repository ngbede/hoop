import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/api/network.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Standing extends StatefulWidget {
  final dynamic json;
  Standing({@required this.json});
  @override
  _StandingState createState() => _StandingState();
}

class _StandingState extends State<Standing> {
  List<DataRow> getTable() {
    List<DataRow> table = [];
    int j = 0;

    for (String id in eastID.keys) {
      var rank = int.parse(
          '${widget.json['api']['standings'][j]['conference']['rank']}');
      table.add(
        DataRow(
          cells: <DataCell>[
            DataCell(
              Text('$rank'),
            ),
            DataCell(
              Text(
                '${eastID[widget.json['api']['standings'][j]['teamId']]}', // ${teamID[id]} json['api']['standings'][j]['winPercentage']
              ),
            ),
            DataCell(
              Text('23'),
            ),
            DataCell(
              Text('${widget.json['api']['standings'][j]['win']}'),
            ),
          ],
        ),
      );
      j++;
    }
    return table;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      child: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: 0,
          sortAscending: true,
          horizontalMargin: 15,
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Rank'),
            ),
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Losses'),
            ),
            DataColumn(
              label: Text('Wins'),
            ),
          ],
          rows: getTable(),
        ),
      ),
    );
  }
}
