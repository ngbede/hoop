import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/widgets/bounce.dart';
import 'package:hoop/api/urls.dart';
import 'package:hoop/api/network.dart';
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
      //var eastIdsJson = await Network.getJson(Urls.eastTeamsUrl);
      //var westIdsJson = await Network.getJson(Urls.westTeamsUrl);
      Provider.of<JsonFiles>(context, listen: false).setEastStandings(eastJson);
      Provider.of<JsonFiles>(context, listen: false).setWestStandings(westJson);
      // print(eastJson);
      // print("\n\n");
      // print(westJson);
      //Provider.of<JsonFiles>(context, listen: false).setEastId(eastIdsJson);
      //Provider.of<JsonFiles>(context, listen: false).setWestId(westIdsJson);
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
