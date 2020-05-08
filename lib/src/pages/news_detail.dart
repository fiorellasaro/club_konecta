import 'package:club_konecta/src/pages/rating.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:club_konecta/src/providers/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:club_konecta/src/model/news_json_model.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({this.news, this.detail});
  final HttpServiceNews httpService = HttpServiceNews();
  final int news;
  final Noticia detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Noticias'),
          backgroundColor: Color(0xff03DAC5),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(detail.banner),
              Text(
                detail.titulo,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(detail.perfil.foto),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        detail.perfil.nombre + " " + detail.perfil.apellido,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(detail.perfil.direccion)
                    ],
                  )
                ],
              ),
              Text(detail.contenido),
              Text('¿Te gustó el artículo?'),
              Rating(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  detail.comentario.length.toString() + ' comentarios',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
              Column(
                children:
                    listOfComments(detail.comentario.length, detail.comentario),
              ),
            ],
          ),
        ));
  }
}

List<Widget> listOfComments(numero, comentarios) {
  List<Widget> listCards = List<Widget>();
  for (int i = 0; i < numero; i++) {
    listCards.add(Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(comentarios[i].perfil.foto),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  comentarios[i].comentario,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(comentarios[i].fechaPublicacion)
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    ));
  }
  return listCards;
}
