import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';
import 'package:hoop/components/tabbar.dart';

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  Future<bool> getFile() async {
    bool complete = false;
    try {
      var eastJson = await Network.getJson(Urls.eastStandingsUrl);
      var westJson = await Network.getJson(Urls.westStandingsUrl);
      Provider.of<JsonFiles>(context, listen: false).setEastStandings(eastJson);
      Provider.of<JsonFiles>(context, listen: false).setWestStandings(westJson);
      for (int idx = 0; idx < 15; idx++) {
        Provider.of<JsonFiles>(context, listen: false)
            .setEastIdIndex(eastJson["api"]["standings"][idx]["teamId"], idx);
        Provider.of<JsonFiles>(context, listen: false)
            .setWestIdIndex(westJson["api"]["standings"][idx]["teamId"], idx);
      }
      if ((Provider.of<JsonFiles>(context, listen: false).getEastStandings() !=
              null) &&
          (Provider.of<JsonFiles>(context, listen: false).getWestStandings() !=
              null)) {
        complete = true; // data gotten
      }
    } catch (e) {
      print(e);
    }
    return complete;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF1F6BA3),
          automaticallyImplyLeading: false, // hides back arrow button
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
        body: ((Provider.of<JsonFiles>(context, listen: false)
                        .getEastStandings()) ==
                    null &&
                (Provider.of<JsonFiles>(context, listen: false)
                        .getEastStandings() ==
                    null))
            ? FutureBuilder(
                future: getFile(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  Widget table;
                  if (snapshot.hasData) {
                    table = Bar(
                      eastTable:
                          Provider.of<JsonFiles>(context).getEastStandings(),
                      westTable:
                          Provider.of<JsonFiles>(context).getWestStandings(),
                    );
                  } else if (snapshot.hasError) {
                    table = Center(
                      child: Icon(
                        Icons.error,
                        size: 50,
                      ),
                    );
                  } else {
                    table = Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return table;
                },
              )
            : Bar(
                eastTable: Provider.of<JsonFiles>(context).getEastStandings(),
                westTable: Provider.of<JsonFiles>(context).getWestStandings(),
              ),
      ),
    );
  }
}
