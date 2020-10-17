import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';
import 'package:hoop/constant.dart';

class Players extends StatefulWidget {
  @override
  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Name: ${eastID[Provider.of<JsonFiles>(context).getEastStandings()["api"]["standings"][3]["teamId"]]}',
        ),
        Text(
          'Rank: ${Provider.of<JsonFiles>(context).getEastStandings()["api"]["standings"][0]["conference"]["rank"]}',
        ),
        Text(
          'Losses: ${Provider.of<JsonFiles>(context).getEastStandings()["api"]["standings"][0]["loss"]}',
        ),
        Text(
          'Wins: ${Provider.of<JsonFiles>(context).getEastStandings()["api"]["standings"][0]["win"]}',
        ),
        Text(
          'Win Pct: ${Provider.of<JsonFiles>(context).getEastStandings()["api"]["standings"][0]["winPercentage"]}',
        ),
      ],
    );
  }
}
