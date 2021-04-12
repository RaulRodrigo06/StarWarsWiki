import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/characters.dart';

class Api {
  showList() async {
    var url = Uri.parse('https://swapi.dev/api/people/');
    http.Response response = await http.get(url);
    decode(response);
  }

  List<Character> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      List<Character> character = decoded["results"].map<Character>((map) {
        return Character.fromJson(map);
      }).toList();
      return character;
    } else {
      throw Exception("Failed to load videos");
    }
  }
}
