import 'package:desafio_flutter/delegates/search_delegate.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: Text("StarWars Wiki"),
          actions: <Widget>[
            Align(alignment: Alignment.center, child: Text("0")),
            IconButton(icon: Icon(Icons.star), onPressed: () {}),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String? result =
                    await showSearch(context: context, delegate: DataSearch());
                print(result);
              },
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("lib/images/backgroundpic.jpeg"))),
          child: Column(
            children: [],
          ),
        ));
  }
}
