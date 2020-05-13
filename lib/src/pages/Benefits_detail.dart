import 'package:club_konecta/src/pages/rating.dart';

import 'package:club_konecta/src/providers/beneficios_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:club_konecta/src/model/beneficios_model.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class BenefitsDetail extends StatelessWidget {
  BenefitsDetail({this.title,this.benefits, this.detail});
  final HttpServiceBenefits httpService = HttpServiceBenefits();
  final int benefits;
  final Beneficio detail;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Color(0xff03DAC5),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                detail.banner,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  detail.titulo,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(detail.perfil.foto),
                    ),
                    SizedBox(
                      width: 15,
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
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(detail.contenido, textAlign: TextAlign.justify),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text('¿Te gustó el artículo?'),
                      SizedBox(
                        height: 10,
                      ),
                      Rating(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.mode_comment,
                        color: Colors.grey,
                      ),
                      Text(
                        detail.comentario.length.toString() + ' comentarios',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: listOfComments(
                      detail.comentario.length, detail.comentario),
                ),
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
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 1,
                      ),
                    ),
                    child: Text(
                      comentarios[i].comentario,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text(comentarios[i].fechaPublicacion.substring(0, 10)),
                      SizedBox(
                        width: 30,
                      ),
                      Text(comentarios[i].fechaPublicacion.substring(11, 16)),
                    ],
                  ),
                ],
              ),
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
