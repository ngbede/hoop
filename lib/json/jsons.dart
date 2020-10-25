import 'package:flutter/foundation.dart';

class JsonFiles with ChangeNotifier {
  var _westStandings;
  var _eastStandings;
  var _eastId;
  var _westId;
  Map _idEastIndex = {};
  Map _idWestIndex = {};

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
}
