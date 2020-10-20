import 'package:flutter/material.dart';

class TeamInfo extends StatelessWidget {
  final String team;
  TeamInfo({@required this.team});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(team),
        ],
      ),
    );
  }
}
