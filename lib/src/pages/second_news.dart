import 'package:club_konecta/src/providers/news_provider.dart';
import 'rating.dart';
import 'package:club_konecta/src/model/news_json_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondNewsBenefits extends StatelessWidget {
  final HttpServiceNews httpService = HttpServiceNews();
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
                margin: EdgeInsets.only(bottom: 05.0),
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
                    List<Noticia> posts = snapshot.data;

                    return Column(
                      children: posts
                          .map(
                            (Noticia post) => Card(
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
                                              Image.asset('assets/example1.png',
                                                  fit: BoxFit.cover, width: 1000.0),
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
                                                  child: Text(
                                                    post.titulo,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
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
                                              post.fechaPublicacion,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            post.resumen,
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
            FutureBuilder(
              future: httpService.getNews(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Noticia>> snapshot) {
                if (snapshot.hasData) {
                  List<Noticia> posts = snapshot.data;

                  return Column(
                    children: posts
                        .map(
                          (Noticia post) => Card(
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
                                            Image.asset('assets/example1.png',
                                                fit: BoxFit.cover, width: 1000.0),
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
                                                child: Text(
                                                  post.titulo,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
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
                                        Text(
                                          post.titulo,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          post.resumen,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Rating()
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
          ],
        ),
      ),
    );

  }
}