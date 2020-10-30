import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/components/bounce.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/services/network.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  void getFile() async {
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
      Navigator.pushNamed(context, "/layout");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getFile();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BouncingBall(),
    );
  }
}
