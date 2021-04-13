import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/blocs/character_bloc.dart';
import 'package:desafio_flutter/blocs/character_search_bloc.dart';
import 'package:desafio_flutter/blocs/fav_bloc.dart';
import 'package:desafio_flutter/pages/screens_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterBloc>(
        bloc: CharacterBloc(),
        child: BlocProvider<CharacterSearchBloc>(
            bloc: CharacterSearchBloc(),
            child: BlocProvider<FavBloc>(
              bloc: FavBloc(),
              child: MaterialApp(
                title: 'StarWars Wiki',
                home: ScreenPage(),
              ),
            )));
  }
}
