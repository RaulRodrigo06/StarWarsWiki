import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/blocs/character_search_bloc.dart';
import 'package:desafio_flutter/delegates/search_delegate.dart';
import 'package:desafio_flutter/widgets/character_tile.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocsearch = BlocProvider.of<CharacterSearchBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("Search Page"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result =
                  await showSearch(context: context, delegate: DataSearch());
              if (result != null) blocsearch.inSearch.add(result);
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: blocsearch.outCharacter,
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
