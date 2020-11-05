import 'package:flutter/material.dart';

//FIXME: fix render overflow error
class Roster extends StatelessWidget {
  final dynamic json;
  Roster({this.json});
  List<List<DataRow>> roster() {
    List<DataRow> playerNames = [];
    List<DataRow> playerAttributes = [];
    for (int index = 0; index < json["api"]["results"]; index++) {
      dynamic base = json["api"]["players"][index];
      Map league = base["leagues"];
      if (league.length == 1 && league.keys.contains("standard")) {
        playerNames.add(
          DataRow(
            cells: [
              DataCell(
                Text("${base["firstName"]} ${base["lastName"]}"),
              ),
            ],
          ),
        );

        playerAttributes.add(
          DataRow(
            cells: [
              DataCell(
                Text(
                  "${league["standard"]["pos"]}", //["standard"]["pos"]
                ),
              ),
              DataCell(
                Text(
                  "${league["standard"]["jersey"]}", //["standard"]["jersey"]
                ),
              ),
              DataCell(
                Text(
                  "${base["heightInMeters"]}",
                ),
              ),
              DataCell(
                Text("${base["weightInKilograms"]}"),
              ),
              DataCell(
                Text("${base["dateOfBirth"]}"),
              ),
              DataCell(
                Text("${base["collegeName"]}"),
              ),
            ],
          ),
        );
      }
    }
    return [playerNames, playerAttributes];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // TODO: remove Expanded widget, this is just a short term fix
      child: Row(
        children: [
          DataTable(
            columns: [
              DataColumn(
                label: Text("Name"),
              ),
            ],
            rows: roster()[0],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Pos.',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'No.',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Height',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Weight',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'DOB(Y-M-D)',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'From',
                    ),
                  ),
                ],
                rows: roster()[1],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
