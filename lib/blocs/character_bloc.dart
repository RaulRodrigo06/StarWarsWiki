import 'dart:async';
import 'package:desafio_flutter/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/models/characters.dart';
import 'package:rxdart/rxdart.dart';

class CharacterBloc implements BlocBase {
  Api api;
  bool _research = false;
  List<Character> character;

  final BehaviorSubject<List<Character>> _characterController =
      BehaviorSubject<List<Character>>();
  Stream<List<Character>> get outCharacter => _characterController.stream;
  final BehaviorSubject<String> _searchController = BehaviorSubject();
  Sink get inSearch => _searchController.sink;

  CharacterBloc() {
    api = Api();
    _searchController.stream.listen(_search);
    show();
  }

  void _search(String search) async {
    if (search != null) {
      _research = true;
      character = await api.showSearch(search);
    } else if (search == null && _research == false) {
      character += await api.nexPage();
    }

    _characterController.sink.add(character);
  }

  void show() async {
    character = await api.showList();
    _characterController.sink.add(character);
  }

  @override
  void dispose() {
    _characterController.close();
    _searchController.close();
  }
}
