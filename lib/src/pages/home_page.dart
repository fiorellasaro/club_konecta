import 'package:club_konecta/src/pages/events_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
    DisplaysWidget(Colors.green),
    EventoPage(),
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
            icon: Icon(MdiIcons.medal),
            title: Text('Reconocimientos'),
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
    // Navigator.pushNamed(context, '$index');
    setState(() {
      _currentIndex = index;
    });
  }
}
