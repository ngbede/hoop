import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
//import 'package:hoop/screens/views/results.dart';
import 'package:hoop/components/roster.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
// import 'package:hoop/json/jsons.dart';

class PlayerList extends StatelessWidget {
  final String teamId;
  PlayerList({this.teamId});
  @override
  Widget build(BuildContext context) {
    return Provider.of<JsonFiles>(context, listen: false)
                .getTeamRoster(teamId) ==
            null
        ? FutureBuilder<dynamic>(
            future: Network.getJson(Urls.teamPlayersUrl(teamId)),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              Widget playerList;
              if (snapshot.hasData) {
                Provider.of<JsonFiles>(context, listen: false).addTeamPlayers(
                    teamId, snapshot.data); // add teamRoster json to Provider
                print(snapshot.data);
                playerList = Roster(
                  json: snapshot.data,
                );
              } else if (snapshot.hasError) {
                playerList = Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      size: 50,
                    ),
                    Text("Something went wrong!"),
                  ],
                );
              } else {
                playerList = Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                );
              }
              return playerList;
            },
          )
        : Roster(
            json: Provider.of<JsonFiles>(context, listen: false)
                .getTeamRoster(teamId),
          );
  }
}
