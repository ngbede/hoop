import 'package:flutter/material.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';
import 'package:hoop/components/games_widgets/gamelst.dart';

class Games extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<JsonFiles>(context, listen: false).getGames() == null
        ? FutureBuilder(
            future: Network.getJson(Urls.seasonGames),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                Provider.of<JsonFiles>(context, listen: false)
                    .setGames(snapshot.data);
                dynamic json = snapshot.data;
                return SeasonGames(
                  jsonFile: json,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        size: 50,
                      ),
                      Text("Something went wrong!"),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
        : SeasonGames(
            jsonFile: Provider.of<JsonFiles>(context).getGames(),
          );
  }
}
