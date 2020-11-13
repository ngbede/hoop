import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/games_widgets/time.dart';

//TODO: group game cards based on the date played
class SeasonGames extends StatelessWidget {
  final dynamic jsonFile;
  SeasonGames({this.jsonFile});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CachedLogo(
                          url: allTeams[json["hTeam"]["teamId"]][2],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          json["hTeam"]["score"]["points"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${gameTime[2]}/${gameTime[1]}/${gameTime[0]} ${gameTime[3]}:${gameTime[4]}",
                          style: TextStyle(fontSize: 8),
                        ),
                        Text(
                          "Vs",
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          json["vTeam"]["score"]["points"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CachedLogo(
                          url: allTeams[json["vTeam"]["teamId"]][2],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          card = SizedBox(
            height: 0,
          );
        }
        return card;
      },
    );
  }
}
