import 'package:club_konecta/src/model/reconocimiento_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:club_konecta/src/providers/reconocimiento_provider.dart';
import 'package:flutter/material.dart';
// import 'package:youtube_player/youtube_player.dart';


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
                    AsyncSnapshot<List<Reconocimiento>> snapshot) {
                  if (snapshot.hasData) {
                    List<Reconocimiento> reconocimiento = snapshot.data;
                    return ListView(
                      children: reconocimiento
                          .map(
                            (Reconocimiento reconocimiento) => Card(
                              child: new Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 10.0),
                                    child: Text(
                                      reconocimiento.titulo,
                                      style: TextStyle(
                                        fontFamily: 'Monserrate',
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                FadeInImage(
                                placeholder: AssetImage('assets/original.gif'), 
                                image: NetworkImage(reconocimiento.banner),
                                fadeInDuration: Duration(milliseconds: 200),
                                height: 300.0,
                                fit: BoxFit.cover,
                                ),
                              // YoutubePlayer(
                              //   context: context,
                              //   source: "7QUtEmBT_-w",
                              //   quality: YoutubeQuality.HD,
                              //   aspectRatio: 16 / 9,
                              // ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 15.0),
                                    child: Text(
                                      reconocimiento.contenido,
                                      style: TextStyle(
                                        fontFamily: 'Monserrate',
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.justify,
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
