import 'package:club_konecta/src/pages/events_page.dart';
import 'package:club_konecta/src/pages/profile_page.dart';
import 'package:club_konecta/src/pages/second_news.dart';
import 'package:club_konecta/src/pages/teky.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:club_konecta/src/pages/teky.dart';
// import 'package:url_launcher/url_launcher.dart';
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
    NewsAndBenefits(),
    KuentanosPage(),
    DisplaysWidget(Colors.green),
    EventPage(),
    SecondNewsBenefits(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getNav(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
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
            icon: ImageIcon(AssetImage("assets/kamu.png"),),
            title: Text('Kami'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.medal),
            title: Text('Logros'),
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

  PreferredSizeWidget getNav() {
    if (_currentIndex == 0)
      return getNavHome();
    else
      return getSecondNav();
  }

  PreferredSizeWidget getNavHome() {
    return AppBar(
      backgroundColor: Color(0xff03DAC5),
      leading: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CircleAvatar(
          radius: 55,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
           child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
                 print('tap avatar');
                }, 
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/2.jpg'),
              ),
            ),
          ),
        ),
      ),
      title: const Text('Club Konecta'),
      actions: <Widget>[
        Icon(
          Icons.notifications,
        ),
      ],
    );
  }

  PreferredSizeWidget getSecondNav() {
    List<String> navItemsTitle = [
      "Home",
      "Kuentanos",
      "Kami",
      "Reconocimientos y Eventos",
      "Noticias"
    ];
    return AppBar(
      backgroundColor: Color(0xff03DAC5),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          setState(() {
            _currentIndex = 0;
          });
        },
      ),
      title: Text(navItemsTitle[_currentIndex]),
    );
  }
}
