import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/blocs/fav_bloc.dart';
import 'package:desafio_flutter/models/characters.dart';
import 'package:desafio_flutter/widgets/character_full_tile.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  final Character character;

  CharacterTile(this.character);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavBloc>(context);
    return GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("lib/images/backgroundpic2.jpeg"),
                  fit: BoxFit.cover)),
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Nome: ${character.name}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Altura: ${character.height}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Peso: ${character.mass}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Gênero: ${character.gender}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              StreamBuilder<Map<String, Character>>(
                stream: bloc.outFav,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return IconButton(
                      icon: Icon(snapshot.data.containsKey(character.name)
                          ? Icons.star
                          : Icons.star_border),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {
                        bloc.toggleFav(character);
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return CharacterFullTile(
              character: character,
            );
          }));
        });
  }
}
