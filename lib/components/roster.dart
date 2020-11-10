import 'package:flutter/material.dart';

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
                Text(
                  "${base["firstName"]} ${base["lastName"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );

        playerAttributes.add(
          DataRow(
            cells: [
              DataCell(
                Text(
                  league["standard"]["pos"].toString().isEmpty
                      ? "-"
                      : "${league["standard"]["pos"]}",
                ),
              ),
              DataCell(
                Text(
                  league["standard"]["jersey"].toString().isEmpty
                      ? "-"
                      : "${league["standard"]["jersey"]}",
                ),
              ),
              DataCell(
                Text(
                  base["heightInMeters"].toString().isEmpty
                      ? "-"
                      : "${base["heightInMeters"]}",
                ),
              ),
              DataCell(
                Text(
                  base["weightInKilograms"].toString().isEmpty
                      ? "-"
                      : "${base["weightInKilograms"]}",
                ),
              ),
              DataCell(
                Text(
                  base["dateOfBirth"].toString().isEmpty
                      ? "-"
                      : "${base["dateOfBirth"]}",
                ),
              ),
              DataCell(
                Text(
                  base["collegeName"].toString().isEmpty
                      ? "-"
                      : "${base["collegeName"]}",
                ),
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
    return Row(
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
                    'Pos',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'No',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'H(m)',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'W(kg)',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'DOB',
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
    );
  }
}
