import 'package:club_konecta/src/model/beneficios_model.dart';
import 'package:club_konecta/src/providers/beneficios_provider.dart';
import 'package:club_konecta/src/providers/news_provider.dart';
import 'rating.dart';
import 'package:club_konecta/src/model/news_json_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondNewsBenefits extends StatelessWidget {
  final HttpServiceNews httpService = HttpServiceNews();
  final HttpServiceBenefits httpServiceBenefict = HttpServiceBenefits();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              heightFactor: 2.5,
              alignment: Alignment.centerLeft,
              child: Container(
                // margin: EdgeInsets.only(bottom: 05.0),
                child: Text(
                  "Entérate",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: new EdgeInsets.all( 10.0),
              child: FutureBuilder(
                future: httpService.getNews(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Noticia>> snapshot) {
                  if (snapshot.hasData) {
                    List<Noticia> noticias = snapshot.data;

                    return Column(
                      children: noticias
                          .map(
                            (Noticia noticia) => Card(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Container(
//                  margin: EdgeInsets.all(5.0),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(5.0)),
                                          child: Stack(
                                            children: <Widget>[
                                              // Image.asset('assets/example1.png',
                                              //     fit: BoxFit.cover, width: 1000.0),
                                              Image(image: NetworkImage(noticia.banner)),
                                              Positioned(
                                                bottom: 0.0,
                                                left: 0.0,
                                                right: 0.0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color.fromARGB(
                                                            200, 0, 0, 0),
                                                        Color.fromARGB(0, 0, 0, 0)
                                                      ],
                                                      begin: Alignment.bottomCenter,
                                                      end: Alignment.topCenter,
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 20.0),
                                                 
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Text(
                                              noticia.titulo,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            noticia.resumen,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Rating(),),
                                        ],
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
                  return CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Align(
              heightFactor: 2.5,
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Beneficios",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: new EdgeInsets.all( 10.0),
              child: FutureBuilder(
                future: httpServiceBenefict.getBenefits(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Beneficio>> snapshot) {
                  if (snapshot.hasData) {
                    List<Beneficio> benefits = snapshot.data;

                    return Column(
                      children: benefits
                          .map(
                            (Beneficio benefit) => Card(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Container(
//                  margin: EdgeInsets.all(5.0),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(5.0)),
                                          child: Stack(
                                            children: <Widget>[
                                              
                                              Image(image: NetworkImage(benefit.banner)),
                                              Positioned(
                                                bottom: 0.0,
                                                left: 0.0,
                                                right: 0.0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color.fromARGB(
                                                            200, 0, 0, 0),
                                                        Color.fromARGB(0, 0, 0, 0)
                                                      ],
                                                      begin: Alignment.bottomCenter,
                                                      end: Alignment.topCenter,
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 20.0),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Text(
                                              benefit.titulo,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            benefit.resumen,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Rating()),
                                        ],
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
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );

  }
}