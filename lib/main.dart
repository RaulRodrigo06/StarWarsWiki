import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/API.dart';
import 'package:desafio_flutter/blocs/character_bloc.dart';
import 'package:desafio_flutter/blocs/character_search_bloc.dart';
import 'package:desafio_flutter/pages/screens_page.dart';
import 'package:flutter/material.dart';

void main() {
  Api api = Api();
  api.showList();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterBloc>(
        bloc: CharacterBloc(),
        child: BlocProvider<CharacterSearchBloc>(
          bloc: CharacterSearchBloc(),
          child: MaterialApp(
            title: 'StarWars Wiki',
            home: ScreenPage(),
          ),
        ));
  }
}
