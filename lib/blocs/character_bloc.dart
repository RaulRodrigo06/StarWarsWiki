import 'dart:async';
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
  Map<String, Character> _character = {};

  final BehaviorSubject<List<Character>> _characterController =
      BehaviorSubject<List<Character>>();
  Stream<List<Character>> get outCharacter => _characterController.stream;
  final BehaviorSubject<String> _listController = BehaviorSubject();

  CharacterBloc() {
    api = Api();
    list();
  }

  void list() async {
    if (character == null) {
      character = await api.showList();
    }
    character += await api.nexPage();
    _characterController.sink.add(character);
  }

  @override
  void dispose() {
    _characterController.close();
    _listController.close();
  }
}
