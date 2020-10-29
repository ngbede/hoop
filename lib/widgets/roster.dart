import 'package:flutter/material.dart';

class Roster extends StatelessWidget {
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
          rows: [
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Zion Williamson",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
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
              rows: [
                DataRow(
                  cells: [
                    DataCell(
                      Text("PF"), //
                    ),
                    DataCell(
                      Text("0"),
                    ),
                    DataCell(
                      Text("6.6ft"),
                    ),
                    DataCell(
                      Text("285lb"),
                    ),
                    DataCell(
                      Text("20-06-2000"),
                    ),
                    DataCell(
                      Text("Duke University"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
