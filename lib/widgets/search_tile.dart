import 'package:desafio_flutter/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  final Character character;

  CharacterTile(this.character);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}
