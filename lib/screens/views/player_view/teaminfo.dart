import 'package:hoop/components/cacheimg.dart';
import 'package:flutter/material.dart';
import 'package:hoop/components/statcard.dart';
import 'package:hoop/components/roster.dart';

//TODO: Get list of players in each team
//TODO: Add a link to each teams official website
class TeamDetails extends StatelessWidget {
  final dynamic json;
  final String teamurl;
  TeamDetails({@required this.json, @required this.teamurl});
  @override
  Widget build(BuildContext context) {
    final String streak = json["winStreak"] == "1"
        ? "W"
        : "L"; // has the team been on a winning or losing streak
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFEDF1FF),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CachedLogo(
                        url: teamurl,
                        radius: 45,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              StatCard(
                                item1:
                                    "Home: ${json["home"]["win"]} - ${json["home"]["loss"]}",
                                item2:
                                    "Road: ${json["away"]["win"]} - ${json["home"]["loss"]}",
                                item3:
                                    "Last 10: ${json["lastTenWin"]} - ${json["lastTenLoss"]}",
                                item4: "Streak: $streak${json["streak"]}",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              StatCard(
                                item1: "Win: ${json["win"]}",
                                item2: "Loss: ${json["loss"]}",
                                item3: "Pct: ${json["winPercentage"]}%",
                                item4: "GB: ${json["gamesBehind"]}",
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              StatCard(
                                item1: "Division",
                                item2:
                                    "${json["division"]["name"].toString().toUpperCase()}",
                                item3:
                                    "${json["division"]["win"]} - ${json["division"]["loss"]}",
                                item4: "Rank: ${json["division"]["rank"]}",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              StatCard(
                                item1: "Conference",
                                item2:
                                    "${json["conference"]["name"].toString().toUpperCase()}",
                                item3:
                                    "${json["conference"]["win"]} - ${json["conference"]["loss"]}",
                                item4: "Rank: ${json["conference"]["rank"]}",
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Player List",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Roster()
            ],
          ),
        ),
      ),
    );
  }
}
