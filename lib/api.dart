import 'dart:convert';
import 'package:desafio_flutter/models/homeworld.dart';
import 'package:desafio_flutter/models/specie.dart';
import 'package:http/http.dart' as http;

import 'models/characters.dart';

class Api {
  String _nextPage;
  int count;

  List<Character> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      _nextPage = decoded["next"];
      count = decoded["count"];

      List<Character> characterList = decoded["results"].map<Character>((map) {
        return Character.fromJson(map);
      }).toList();

      for (Character character in characterList) {
        if (character.speciesUrl != null && character.speciesUrl.isNotEmpty) {
          getSpecies(character.speciesUrl[0])
              .then((value) => character.specie = value);
        }
        if (character.urlHomeWorld != null) {
          getHomeWorld(character.urlHomeWorld)
              .then((value) => character.homeWorld = value);
        }
      }

      return characterList;
    } else {
      throw Exception("Failed to load Character");
    }
  }

  Future getSpecies(String urlSpecie) async {
    urlSpecie = urlSpecie.replaceFirst('http', 'https');
    var url = Uri.parse(urlSpecie);
    http.Response response = await http.get(url);
    var decoded = json.decode(response.body);
    Specie specie = Specie.fromJson(decoded);
    return specie;
  }

  Future getHomeWorld(String urlHomeWorld) async {
    urlHomeWorld = urlHomeWorld.replaceFirst('http', 'https');
    var url = Uri.parse(urlHomeWorld);
    http.Response response = await http.get(url);
    var decoded = json.decode(response.body);
    HomeWorld homeworld = HomeWorld.fromJson(decoded);
    return homeworld;
  }

  showList() async {
    var url = Uri.parse('https://swapi.dev/api/people/');
    http.Response response = await http.get(url);
    return decode(response);
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
    if (_nextPage != null) {
      _nextPage = _nextPage[34];
      var url = Uri.parse('https://swapi.dev/api/people/?page=$_nextPage');
      http.Response response = await http.get(url);
      return decode(response);
    }
  }
}
