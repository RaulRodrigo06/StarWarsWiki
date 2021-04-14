import 'dart:convert';

import 'package:desafio_flutter/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/models/characters.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharacterBloc implements BlocBase {
  Api api;
  List<Character> character;
  List<Character> characterlist;

  final BehaviorSubject<List<Character>> _characterController =
      BehaviorSubject<List<Character>>();
  Stream<List<Character>> get outCharacter => _characterController.stream;
  final BehaviorSubject<String> _listController = BehaviorSubject();

  CharacterBloc() {
    api = Api();
    /*
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getKeys().contains("character")) {
        character = json.decode(prefs.getString("character")).map((k, v) {
          return MapEntry(k, Character.fromJson(v));
        }).cast<String, Character>();
        _characterController.add(character);
      }
    });
    */
    list();
  }

  void list() async {
    if (character == null) {
      character = await api.showList();
    }
    character += await api.nexPage();
    _characterController.sink.add(character);

    //_saveFav();
  }

/*
  void _saveFav() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("character", json.encode(character));
    });
  }
*/
  @override
  void dispose() {
    _characterController.close();
    _listController.close();
  }
}
