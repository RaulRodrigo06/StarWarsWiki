import 'package:desafio_flutter/pages/fav_page.dart';
import 'package:desafio_flutter/pages/home_page.dart';
import 'package:desafio_flutter/pages/search_page.dart';
import 'package:flutter/material.dart';

class ScreenPage extends StatefulWidget {
  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("StarWarsWiki"),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "Início",
              ),
              Tab(
                text: "Favoritos",
              ),
              Tab(
                text: "Pesquisar",
              )
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Home(),
            FavPage(),
            SearchPage(),
          ],
        ),
      ),
    );
  }
}
