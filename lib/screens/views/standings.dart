import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/widgets/table.dart';

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF1F6BA3),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "East",
              ),
              Tab(
                text: "West",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ConfTable(
                json: Provider.of<JsonFiles>(context).getEastStandings(),
                teamIds: eastID,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ConfTable(
                json: Provider.of<JsonFiles>(context).getWestStandings(),
                teamIds: westID,
              ),
            )
          ],
        ),
      ),
    );
  }
}
