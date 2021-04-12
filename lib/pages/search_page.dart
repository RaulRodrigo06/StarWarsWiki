import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/blocs/character_bloc.dart';
import 'package:desafio_flutter/delegates/search_delegate.dart';
import 'package:desafio_flutter/widgets/search_tile.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("Search Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result =
                  await showSearch(context: context, delegate: DataSearch());
              if (result != null)
                BlocProvider.of<CharacterBloc>(context).inSearch.add(result);
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<CharacterBloc>(context).outCharacter,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
              itemBuilder: (context, index) {
                return CharacterTile(snapshot.data[index]);
              },
              itemCount: snapshot.data.length,
            );
          else
            return Container();
        },
      ),
    );
  }
}
