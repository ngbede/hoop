import 'package:hoop/components/cacheimg.dart';
import 'package:flutter/material.dart';
import 'package:hoop/components/statcard.dart';
import 'package:hoop/components/playerlst.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class TeamDetails extends StatefulWidget {
  final dynamic json;
  final String teamurl;
  final String name;
  TeamDetails(
      {@required this.json, @required this.teamurl, @required this.name});

  @override
  _TeamDetailsState createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  @override
  Widget build(BuildContext context) {
    Future<void> _launched;
    final String streak = widget.json["winStreak"] == "1"
        ? "W"
        : "L"; // has the team been on a winning or losing streak
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFEDF1FF),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
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
                      Column(
                        children: [
                          CachedLogo(
                            url: widget.teamurl,
                            radius: 45,
                          ),
                          GestureDetector(
                            onTap: () {
                              String name = widget.name == "76ers"
                                  ? "sixers"
                                  : widget.name.toLowerCase();
                              setState(
                                () {
                                  _launched = Network.launchSite(
                                    Urls.link(
                                      name,
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Icon(
                                  Icons.link,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              StatCard(
                                item1:
                                    "Home: ${widget.json["home"]["win"]} - ${widget.json["home"]["loss"]}",
                                item2:
                                    "Road: ${widget.json["away"]["win"]} - ${widget.json["home"]["loss"]}",
                                item3:
                                    "Last 10: ${widget.json["lastTenWin"]} - ${widget.json["lastTenLoss"]}",
                                item4:
                                    "Streak: $streak${widget.json["streak"]}",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              StatCard(
                                item1: "Win: ${widget.json["win"]}",
                                item2: "Loss: ${widget.json["loss"]}",
                                item3: "Pct: ${widget.json["winPercentage"]}%",
                                item4: "GB: ${widget.json["gamesBehind"]}",
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
                                    "${widget.json["division"]["name"].toString().toUpperCase()}",
                                item3:
                                    "${widget.json["division"]["win"]} - ${widget.json["division"]["loss"]}",
                                item4:
                                    "Rank: ${widget.json["division"]["rank"]}",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              StatCard(
                                item1: "Conference",
                                item2:
                                    "${widget.json["conference"]["name"].toString().toUpperCase()}",
                                item3:
                                    "${widget.json["conference"]["win"]} - ${widget.json["conference"]["loss"]}",
                                item4:
                                    "Rank: ${widget.json["conference"]["rank"]}",
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
                "Roster",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              //Roster()
              PlayerList(
                teamId: widget.json["teamId"],
              ),
              FutureBuilder<void>(
                // launch the teams official website
                future: _launched,
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Text('');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
