import 'package:flutter/material.dart';

class FavTileNull extends StatefulWidget {
  @override
  _FavTileNullState createState() => _FavTileNullState();
}

class _FavTileNullState extends State<FavTileNull> {
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
                      image: AssetImage("lib/images/backgroundpic4.jpeg"),
                      fit: BoxFit.cover)),
              child: Text(
                "Adicione um Favorito!",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
