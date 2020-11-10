import 'package:hoop/services/apikey/key.dart'; // get your own nba-Api key

class Urls {
  static final String _apiBaseUrl = "https://api-nba-v1.p.rapidapi.com";
  static final String _teamBaseUrl = "https://www.nba.com/";
  static String eastStandingsUrl =
      "$_apiBaseUrl/standings/standard/2019/conference/east/?rapidapi-key=${NbaApi.key}";
  static String westStandingsUrl =
      "$_apiBaseUrl/standings/standard/2019/conference/west/?rapidapi-key=${NbaApi.key}";
  static String eastTeamsUrl =
      "$_apiBaseUrl/teams/confName/east/?rapidapi-key=${NbaApi.key}";
  static String westTeamsUrl =
      "$_apiBaseUrl/teams/confName/west/?rapidapi-key=${NbaApi.key}";
  static String seasonGames =
      "$_apiBaseUrl/games/league/standard/2019/?rapidapi-key=${NbaApi.key}";
  static String teamPlayersUrl(String id) =>
      "$_apiBaseUrl/players/teamId/$id/?rapidapi-key=${NbaApi.key}";
  static String link(String team) => _teamBaseUrl + team + "/";
}
