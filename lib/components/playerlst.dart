import 'package:flutter/material.dart';
//import 'package:hoop/screens/views/results.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
// import 'package:provider/provider.dart';
// import 'package:hoop/json/jsons.dart';

class PlayerList extends StatefulWidget {
  final String teamId;
  PlayerList({this.teamId});
  @override
  _PlayerListState createState() => _PlayerListState();
}

// display: name, position, jersey_num, wieght, height, country, year_drafted, prior_to_NBA, DOB
// player list concept
// get json file
// loop through json file and select jsons that have the "standard map in their leagues"
// once confirmed the "standard league is present", check that no data field is empty
// if important field are not empty, add player to team list
// aim: with above logic we should have no more than 20 players on each teams roster hopefully
// TODO: figure out a way to prevent unecessary network request i.e get data once and save it via provider

class _PlayerListState extends State<PlayerList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: Network.getJson(Urls.teamPlayersUrl(widget.teamId)),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        String msg;
        if (snapshot.hasData) {
          // Provider.of<JsonFiles>(context, listen: false).addTeamPlayers(
          //     widget.teamId, snapshot.data); // add teamRoster json to Provider
          print(snapshot.data);
          msg = "Number of players: ${snapshot.data["api"]["results"]}";
        } else if (snapshot.hasError) {
          print(snapshot.error);
          msg = "Error occured";
        } else {
          // Appropriate widget to show loading activity
          print(snapshot.connectionState);
          msg = "loading...";
        }
        return Text("$msg");
      },
    );
  }
}
