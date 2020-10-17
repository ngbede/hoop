import 'package:hoop/api/apikey/key.dart'; // get your own nba-Api key

class Urls {
  static String eastStandingsUrl =
      "${NbaApi.baseUrl}/standings/standard/2019/conference/east/?rapidapi-key=${NbaApi.key}";
  static String westStandingsUrl =
      "${NbaApi.baseUrl}/standings/standard/2019/conference/west/?rapidapi-key=${NbaApi.key}";
  static String eastTeamsUrl =
      "${NbaApi.baseUrl}/teams/confName/east/?rapidapi-key=${NbaApi.key}";
  static String westTeamsUrl =
      "${NbaApi.baseUrl}/teams/confName/west/?rapidapi-key=${NbaApi.key}";
}
