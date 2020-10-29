import 'package:flutter/foundation.dart';
import 'package:hoop/model/player.dart';

class JsonFiles with ChangeNotifier {
  var _westStandings;
  var _eastStandings;
  var _eastId;
  var _westId;
  Map _idEastIndex = {};
  Map _idWestIndex = {};
  Map<String, List<Player>> _teamPlayers = {};

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

  Map getEastIdIndex() {
    return _idEastIndex;
  }

  Map getWestIdIndex() {
    return _idWestIndex;
  }

  dynamic getEastStandings() {
    return _eastStandings;
  }

  dynamic getWestStandings() {
    return _westStandings;
  }

  void setEastId(dynamic json) {
    _eastId = json;
    notifyListeners();
  }

  dynamic getEastIds() {
    return _eastId;
  }

  void setWestId(dynamic json) {
    _westId = json;
    notifyListeners();
  }

  dynamic getWestIds() {
    return _westId;
  }

  void addTeamPlayers(String teamId, List<Player> teamList) {
    _teamPlayers[teamId] = teamList;
    notifyListeners();
  }

  dynamic getTeamRoster(String teamId) {
    return _teamPlayers[teamId];
  }
}
