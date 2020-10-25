import 'package:hoop/widgets/cacheimg.dart';
import 'package:flutter/material.dart';

class TeamDetails extends StatelessWidget {
  final dynamic json;
  final String teamurl;
  TeamDetails({@required this.json, @required this.teamurl});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedLogo(
                      url: teamurl,
                    ),
                    Column(
                      children: [
                        Text("TeamID: ${json["teamId"]}"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
