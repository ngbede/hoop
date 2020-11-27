import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/game_card.dart';
import 'package:hoop/components/games_widgets/time.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/model/game_details.dart';

//TODO: group game cards based on the date played
class SeasonGames extends StatelessWidget {
  final dynamic jsonFile;
  SeasonGames({this.jsonFile});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemCount: jsonFile["api"]["results"],
        itemBuilder: (context, index) {
          dynamic json = jsonFile["api"]["games"][index];
          Map allTeams = {}; // combine all teams into single map
          allTeams.addAll(eastID);
          allTeams.addAll(westID);
          Widget card;
          // Check if Id is in allTeam and points aint empty
          if ((allTeams.containsKey(json["hTeam"]["teamId"]) &&
                  allTeams.containsKey(json["vTeam"]["teamId"])) &&
              ((json["hTeam"]["score"]["points"].toString().isNotEmpty))) {
            List<String> gameTime = timeString(json["startTimeUTC"]);

            card = Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GameCard(
                details: GameDetails(
                    homeTeamLogo: allTeams[json["hTeam"]["teamId"]][2],
                    homeTeamPoints:
                        int.tryParse(json["hTeam"]["score"]["points"]) ?? 0,
                    awayTeamLogo: allTeams[json["vTeam"]["teamId"]][2],
                    awayTeamPoints:
                        int.tryParse(json["vTeam"]["score"]["points"]) ?? 0,
                    gameTime: json["startTimeUTC"]),
              ),
            );
          } else {
            card = SizedBox(
              height: 0,
            );
          }
          return card;
        },
      ),
    );
  }
}
