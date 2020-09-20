import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const String key = '';

class Network {
  dynamic jsonFile(String url) async {
    var json;
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        json = convert.jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
    return json;
  }
}

void main() {
  Network net = Network();
  var json = net.jsonFile(
      'https://api-nba-v1.p.rapidapi.com/games/seasonYear/2019/?rapidapi-key=db2fabd3b0msh7d2468c97a95f4ap1e2fe3jsn2abfc4f25e04');
  print(json);
}
