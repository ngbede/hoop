import 'package:hoop/models/players.dart';

class Team {
  String divisionName;
  String divisionRank;
  String homeWin;
  String homeLoss;
  String awayWin;
  String awayLoss;
  String winStreak;
  String confName;
  String confRank;
  String wins;
  String losses;
  String pct;
  String lastTenWins;
  String lastTenLosses;
  String gamesBehind;
  //List<Player> players;

  Team({
    this.divisionName,
    this.divisionRank,
    this.homeWin,
    this.homeLoss,
    this.awayWin,
    this.awayLoss,
    this.winStreak,
    this.confName,
    this.confRank,
    this.wins,
    this.losses,
    this.pct,
    this.lastTenWins,
    this.lastTenLosses,
    this.gamesBehind,
    // this.players,
  });
}
