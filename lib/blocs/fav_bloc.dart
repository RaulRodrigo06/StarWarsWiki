import 'dart:async';
import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/models/characters.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class FavBloc implements BlocBase {
  Api api;
  Map<String, Character> _favs = {};

  final _favController = BehaviorSubject<Map<String, Character>>(seedValue: {});
  Stream<Map<String, Character>> get outFav => _favController.stream;

  FavBloc() {
    api = Api();
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getKeys().contains("favorites")) {
        _favs = json.decode(prefs.getString("favorites")).map((k, v) {
          return MapEntry(k, Character.fromJson(v));
        }).cast<String, Character>();
        _favController.add(_favs);
      }
    });
  }

  void toggleFav(Character character) {
    if (_favs.containsKey(character.name)) {
      _favs.remove(character.name);
    } else {
      _favs[character.name] = character;
      api.sendFav(character.name);
    }
    _favController.sink.add(_favs);
    _saveFav();
  }

  void _saveFav() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("favorites", json.encode(_favs));
    });
  }

  @override
  void dispose() {
    _favController.close();
  }
}
