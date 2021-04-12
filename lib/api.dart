import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/characters.dart';

class Api {
  String _nextPage;

  showList() async {
    var url = Uri.parse('https://swapi.dev/api/people/');
    http.Response response = await http.get(url);
    return decode(response);
  }

  List<Character> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      if (decoded["next"] != null) {
        _nextPage = decoded["next"][34];
      }

      List<Character> character = decoded["results"].map<Character>((map) {
        return Character.fromJson(map);
      }).toList();
      return character;
    } else {
      throw Exception("Failed to load videos");
    }
  }

  showSearch(String search) async {
    if (search != '') {
      var url = Uri.parse('https://swapi.dev/api/people/?search=$search');
      http.Response response = await http.get(url);
      return decode(response);
    } else {
      var url = Uri.parse('https://swapi.dev/api/people/');
      http.Response response = await http.get(url);
      return decode(response);
    }
  }

  nexPage() async {
    var url = Uri.parse('https://swapi.dev/api/people/?page=$_nextPage');
    http.Response response = await http.get(url);
    return decode(response);
  }
}
