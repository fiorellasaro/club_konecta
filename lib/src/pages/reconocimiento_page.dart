import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:club_konecta/src/model/events_model.dart';
import 'package:club_konecta/src/providers/reconocimiento_provider.dart';
import 'package:flutter/material.dart';

class ReconocimientoDetail extends StatelessWidget {
  final HttpServiceReconocimiento httpService = HttpServiceReconocimiento();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reconocimientos"),
        backgroundColor: Color(0xff03DAC5),
      ),
      body: new Container(
        padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ListTile(
              leading:
                  Icon(MdiIcons.medal, size: 30.0, color: Colors.teal[300]),
              title: Text(
                'Reconocimientos',
                style: TextStyle(
                  fontFamily: 'Monserrate',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: httpService.getReconocimientos(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Event>> snapshot) {
                  if (snapshot.hasData) {
                    List<Event> posts = snapshot.data;
                    return ListView(
                      children: posts
                          .map(
                            (Event post) => Card(
                              child: new Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 10.0),
                                    child: Text(
                                      post.title,
                                      style: TextStyle(
                                        fontFamily: 'Monserrate',
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  FadeInImage(
                                    placeholder:
                                        AssetImage('assets/original.gif'),
                                    image: NetworkImage(
                                        'https://estaticos.elperiodico.com/resources/jpg/3/3/dia-madre-1554778597633.jpg'),
                                    fadeInDuration: Duration(milliseconds: 200),
                                    height: 300.0,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 10.0),
                                    child: Text(
                                      post.body,
                                      style: TextStyle(
                                        fontFamily: 'Monserrate',
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }
                  return Center(child: CircularProgressIndicator(
                    backgroundColor: Color(0xff03DAC5),
                  ),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
