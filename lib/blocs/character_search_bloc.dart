import 'dart:async';
import 'package:desafio_flutter/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/models/characters.dart';
import 'package:rxdart/rxdart.dart';

class CharacterSearchBloc implements BlocBase {
  Api api;
  List<Character> charactersearch;

  final BehaviorSubject<List<Character>> _characterController =
      BehaviorSubject<List<Character>>();
  Stream<List<Character>> get outCharacter => _characterController.stream;
  final BehaviorSubject<String> _searchController = BehaviorSubject();
  Sink get inSearch => _searchController.sink;

  CharacterSearchBloc() {
    api = Api();
    _searchController.stream.listen(_search);
  }

  void _search(String search) async {
    charactersearch = await api.showSearch(search);
    _characterController.sink.add(charactersearch);
  }

  @override
  void dispose() {
    _characterController.close();
    _searchController.close();
  }
}
