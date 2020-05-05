import 'package:club_konecta/src/pages/reconocimiento_page.dart';
import 'package:club_konecta/src/pages/teky.dart';
import 'kuentanos.dart';
import 'News.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    News(),
    KuentanosPage(),
    ReconocimientoPage(),
    DisplaysWidget(Colors.green),
    DisplaysWidget(Colors.pink),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Club Konecta'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        fixedColor: Colors.tealAccent[400],
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Kuentanos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Teky'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('mood'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            title: Text('Noticias'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
