import 'package:club_konecta/src/pages/events_detail_page.dart';
import 'package:club_konecta/src/pages/reconocimiento_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        child: new Column(
          children: <Widget>[
            ListTile(
              title: Text(
                  'Queremos compartir momentos increibles contigo de reconocimiento y celebración, porque todos somos FAMILIA KONECTA',
                  style: new TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    color: Colors.grey.shade700,
                    ),
                    textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            new Container(
              width: 220,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new MyCard(
                    icon: new Icon(MdiIcons.partyPopper,
                        size: 70.0, color: Colors.teal[300]),
                    title: new Text("Eventos",
                        style: new TextStyle(fontSize: 18.0)),
                    ruta: EventsDetailsPage(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  new MyCard(
                    icon: new Icon(MdiIcons.medal,
                        size: 70.0, color: Colors.teal[300]),
                    title: new Text("Reconocimiento",
                        style: new TextStyle(fontSize: 18.0)),
                    ruta: ReconocimientoDetail(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  MyCard({this.title, this.icon, this.ruta});

  final Widget title;
  final Widget icon;
  final Widget ruta;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(bottom: 0.0),
      child: new Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 4.0,
        child: new InkWell(
          onTap: () {
            print("tapped");
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => this.ruta),
            );
          },
          child: new Container(
            padding: new EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
            child: new Column(
              children: <Widget>[
                this.icon,
                this.title,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
