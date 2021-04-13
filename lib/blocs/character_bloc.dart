import 'dart:async';
import 'package:desafio_flutter/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/models/characters.dart';
import 'package:rxdart/rxdart.dart';

class CharacterBloc implements BlocBase {
  Api api;
  List<Character> character;

  final BehaviorSubject<List<Character>> _characterController =
      BehaviorSubject<List<Character>>();
  Stream<List<Character>> get outCharacter => _characterController.stream;
  final BehaviorSubject<String> _listController = BehaviorSubject();

  CharacterBloc() {
    api = Api();
    show();
  }

  void list() async {
    character += await api.nexPage();
    _characterController.sink.add(character);
  }

  void show() async {
    character = await api.showList();
    _characterController.sink.add(character);
  }

  @override
  void dispose() {
    _characterController.close();
    _listController.close();
  }
}
