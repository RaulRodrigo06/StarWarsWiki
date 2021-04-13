import 'package:flutter/material.dart';

class SearchTileNull extends StatefulWidget {
  @override
  _SearchTileNullState createState() => _SearchTileNullState();
}

class _SearchTileNullState extends State<SearchTileNull> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage("lib/images/backgroundpic3.jpeg"),
                      fit: BoxFit.cover)),
              child: Text(
                "Faça uma Pesquisa!",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
