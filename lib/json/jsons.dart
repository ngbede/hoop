import 'package:flutter/foundation.dart';

class JsonFiles with ChangeNotifier {
  var _westStandings;
  var _eastStandings;
  var _eastId;
  var _westId;

  void setWestStandings(dynamic json) {
    _westStandings = json;
    notifyListeners();
  }

  void setEastStandings(dynamic json) {
    _eastStandings = json;
    notifyListeners();
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
