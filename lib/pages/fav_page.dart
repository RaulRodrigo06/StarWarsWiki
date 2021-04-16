import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/blocs/fav_bloc.dart';
import 'package:desafio_flutter/models/characters.dart';
import 'package:desafio_flutter/widgets/character_tile.dart';
import 'package:desafio_flutter/widgets/fav_null_tile.dart';
import 'package:flutter/material.dart';

class FavPage extends StatefulWidget {
  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Favorite Page"),
        actions: <Widget>[],
      ),
      body: StreamBuilder<Map<String, Character>>(
          initialData: {},
          stream: bloc.outFav,
          builder: (context, snapshot) {
            return snapshot.data.isEmpty
                ? FavTileNull()
                : ListView(
                    children: snapshot.data.values.map((v) {
                      return CharacterTile(v);
                    }).toList(),
                  );
          }),
    );
  }
}
