import 'package:flutter/cupertino.dart';

class GameDetails {
  final String homeTeamLogo;
  final int homeTeamPoints;
  final String awayTeamLogo;
  final int awayTeamPoints;
  final String gameTime;

  GameDetails(
      {@required this.homeTeamLogo,
      @required this.homeTeamPoints,
      @required this.awayTeamLogo,
      @required this.awayTeamPoints,
      @required this.gameTime});
}
