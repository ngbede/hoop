import 'package:flutter/foundation.dart';

class JsonFiles with ChangeNotifier {
  var _westStandings;
  var _eastStandings;
  var _eastId;
  var _westId;
  var _games;
  Map _idEastIndex = {};
  Map _idWestIndex = {};
  Map<String, dynamic> _teamPlayers = {}; // teamID,Player_list

  void setWestStandings(dynamic json) {
    _westStandings = json;
    notifyListeners();
  }

  void setEastStandings(dynamic json) {
    _eastStandings = json;
    notifyListeners();
  }

  void setEastIdIndex(String teamKey, int listLoc) {
    _idEastIndex[teamKey] = listLoc;
    notifyListeners();
  }

  void setWestIdIndex(String teamKey, int listLoc) {
    _idWestIndex[teamKey] = listLoc;
    notifyListeners();
  }

  void setGames(dynamic json) {
    _games = json;
  }

  void setEastId(dynamic json) {
    _eastId = json;
    notifyListeners();
  }

  void setWestId(dynamic json) {
    _westId = json;
    notifyListeners();
  }

  void addTeamPlayers(String teamId, dynamic teamList) {
    _teamPlayers[teamId] = teamList;
  }

  dynamic getGames() => _games;

  Map getEastIdIndex() => _idEastIndex;

  Map getWestIdIndex() => _idWestIndex;

  dynamic getEastIds() => _eastId;

  dynamic getWestIds() => _westId;

  dynamic getEastStandings() => _eastStandings;

  dynamic getWestStandings() => _westStandings;

  dynamic getTeamRoster(String teamId) => _teamPlayers[teamId];
}
