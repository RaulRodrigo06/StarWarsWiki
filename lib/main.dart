import 'package:desafio_flutter/API.dart';
import 'package:flutter/material.dart';
import 'package:desafio_flutter/pages/home_page.dart';

void main() {
  Api api = Api();
  api.showList();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarWars Wiki',
      home: Home(),
    );
  }
}
