import 'package:hoop/services/apikey/key.dart'; // get your own nba-Api key

class Urls {
  static String eastStandingsUrl =
      "https://api-nba-v1.p.rapidapi.com/standings/standard/2019/conference/east/?rapidapi-key=${NbaApi.key}";
  static String westStandingsUrl =
      "https://api-nba-v1.p.rapidapi.com/standings/standard/2019/conference/west/?rapidapi-key=${NbaApi.key}";
  static String eastTeamsUrl =
      "https://api-nba-v1.p.rapidapi.com/teams/confName/east/?rapidapi-key=${NbaApi.key}";
  static String westTeamsUrl =
      "https://api-nba-v1.p.rapidapi.com/teams/confName/west/?rapidapi-key=${NbaApi.key}";
}
