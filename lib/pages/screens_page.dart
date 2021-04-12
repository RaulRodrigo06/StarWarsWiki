import 'package:desafio_flutter/pages/fav_page.dart';
import 'package:desafio_flutter/pages/home_page.dart';
import 'package:desafio_flutter/pages/search_page.dart';
import 'package:flutter/material.dart';

class ScreenPage extends StatefulWidget {
  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  PageController _pageController;
  int _page = 0;
  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red[900],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favoritos",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Pesquisar",
              backgroundColor: Colors.blue)
        ],
        currentIndex: _page,
        onTap: (p) {
          _pageController.animateToPage(p,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (p) {
          setState(() {
            _page = p;
          });
        },
        children: [
          Home(),
          FavPage(),
          SearchPage(),
        ],
      ),
    );
  }
}
