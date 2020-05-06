import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:club_konecta/src/providers/reconocimiento_provider.dart';
import 'package:flutter/material.dart';

class ReconocimientoPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: 
        new Container(
            padding: new EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
            child: new Column(
                children: <Widget>[
                  ListTile(
                      title: Text('Queremos compartir momentos increibles contigo de reconocimiento y celebración, porque todos somos FAMILIA KONECTA',
                      style: new TextStyle(fontSize: 16.0)
                      ),
                    ),
                     SizedBox( height: 40.0, ),
                     new Container(
                       width: 250,
                       child: new Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: <Widget>[
                          new MyCard(
                            
                            icon: new Icon(MdiIcons.partyPopper,
                          // icon: new Icon(Icons.favorite,
                              size: 70.0, color: Colors.teal[300]),
                          title: new Text("Eventos",
                              style: new TextStyle(fontSize: 20.0)),
                        ),
                        SizedBox( height: 60.0, ),
                        new MyCard(
                          icon: new Icon(MdiIcons.medal,
                              size: 70.0, color: Colors.teal[300]),
                          title: new Text("Reconocimiento",
                              style: new TextStyle(fontSize: 20.0)),
                        ),
                         ],
                       )
                     )
                  
                ])));
  }
}

class MyCard extends StatelessWidget {
  MyCard({this.title, this.icon});

  final Widget title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.only(bottom: 0.0),
        child: new Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 4.0,
            child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: new Column(children: <Widget>[
                  this.icon,
                  this.title,
                ]))));
  }
}
