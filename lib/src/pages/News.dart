import 'package:club_konecta/src/pages/Benefits_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'rating.dart';
import 'package:club_konecta/src/providers/news_provider.dart';
import 'package:club_konecta/src/model/news_json_model.dart';
import 'package:club_konecta/src/model/beneficios_model.dart';
import 'package:club_konecta/src/providers/beneficios_provider.dart';

import 'package:club_konecta/src/pages/news_detail.dart';

final List<String> imgList = [
  'assets/example1.png',
  'assets/example2.png',
  'assets/example3.png',
  'assets/example4.png',
  'assets/example5.png',
  'assets/example6.png'
];

final List<Widget> imageSliders = imgList
    .map((item) => Card(
          child: Column(
            children: <Widget>[
              Container(
                child: Container(
//                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Text(
                                'Noticia ${imgList.indexOf(item) + 1} ',
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
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Noticia ${imgList.indexOf(item) + 1} ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Texto corto noticia ',
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
        ))
    .toList();

class CarouselList extends StatelessWidget {
  final HttpServiceNews httpService = HttpServiceNews();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getNews(),
      builder: (BuildContext context, AsyncSnapshot<List<Noticia>> snapshot) {
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
                                    top: Radius.circular(10.0)),
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
                                              Color.fromARGB(200, 0, 0, 0),
                                              Color.fromARGB(0, 0, 0, 0)
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 20.0),
                                        // child: Text(
                                        //   post.titulo,
                                        //   style: TextStyle(
                                        //     color: Colors.white,
                                        //     fontSize: 20.0,
                                        //     fontWeight: FontWeight.bold,
                                        //   ),
                                        // ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Rating(),
                                ),
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
    );
  }
}

final cardsList = [CarouselList];

class NewsAndBenefits extends StatelessWidget {
  final HttpServiceNews httpService = HttpServiceNews();
  final HttpServiceBenefits httpServiceBenefits = HttpServiceBenefits();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Noticias",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
/*          Container(
            child: Column(
*/ /*          mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,*/ /*
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                      */ /*    autoPlay: true,
                      aspectRatio: 2.0,*/ /*
                      enlargeCenterPage: true,
                      height: 320),
                  items: imageSliders,
                ),
              ],
            ),
          ),*/
          Container(
            width: 1000,
            height: 400,
            padding: new EdgeInsets.all(15.0),
            child: FutureBuilder(
              future: httpService.getNews(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Noticia>> snapshot) {
                if (snapshot.hasData) {
                  List<Noticia> posts = snapshot.data;

                  return ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: posts
                        .map(
                          (Noticia post) => Container(
                            padding: new EdgeInsets.all(15.0),
                            width: 380,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: InkWell(
                                onTap: () {
                                  print("tapped");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => NewsDetail(
                                            title: 'Noticias',
                                            news: post.id,
                                            detail: post)),
                                  );
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Container(
//                  margin: EdgeInsets.all(5.0),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(15.0)),
                                            child: Stack(
                                              children: <Widget>[
                                                Image.network(post.banner,
                                                    fit: BoxFit.cover,
                                                    width: 1000.0,
                                                    height: 150),
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
                                                          Color.fromARGB(
                                                              0, 0, 0, 0)
                                                        ],
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                      ),
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.0,
                                                            horizontal: 20.0),
                                                    // child: Text(
                                                    //   post.titulo,
                                                    //   style: TextStyle(
                                                    //     color: Colors.white,
                                                    //     fontSize: 20.0,
                                                    //     fontWeight:
                                                    //         FontWeight.bold,
                                                    //   ),
                                                    // ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: Text(
                                                post.titulo,
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Rating()),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xff03DAC5),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Tus beneficios",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: new EdgeInsets.all(15.0),
            child: FutureBuilder(
              future: httpServiceBenefits.getBenefits(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Beneficio>> snapshot) {
                if (snapshot.hasData) {
                  List<Beneficio> posts = snapshot.data;

                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: posts
                          .map(
                            (Beneficio post) => Column(
                              children: <Widget>[
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      print("tapped");
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BenefitsDetail(
                                                    title: 'Beneficios',
                                                    benefits: post.id,
                                                    detail: post)),
                                      );
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Container(
//                  margin: EdgeInsets.all(5.0),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            15.0)),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Image.network(post.banner,
                                                        fit: BoxFit.cover,
                                                        width: 1000.0,
                                                        height: 150),
                                                    Positioned(
                                                      bottom: 0.0,
                                                      left: 0.0,
                                                      right: 0.0,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color.fromARGB(
                                                                  200, 0, 0, 0),
                                                              Color.fromARGB(
                                                                  0, 0, 0, 0)
                                                            ],
                                                            begin: Alignment
                                                                .bottomCenter,
                                                            end: Alignment
                                                                .topCenter,
                                                          ),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.0,
                                                                horizontal:
                                                                    20.0),
                                                        // child: Text(
                                                        //   post.titulo,
                                                        //   style: TextStyle(
                                                        //     color: Colors.white,
                                                        //     fontSize: 20.0,
                                                        //     fontWeight: FontWeight.bold,
                                                        //   ),
                                                        // ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 15.0),
                                                  child: Text(
                                                    post.titulo,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  post.resumen,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20.0),
                                                  child: Rating(),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                )
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xff03DAC5),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

    /*   floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
  }
}
/*

class NewsList extends StatelessWidget {
  final List<Noticia> noticia;
  NewsList({Key key, this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: noticia == null ? 0 : noticia.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Container(
              child: new Center(
                  child: new Column(
                // Stretch the cards in horizontal axis
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Text(
                    // Read the name field value and set it in the Text widget
                    noticia[index].id.toString(),
                    // set some style to text
                    style: new TextStyle(
                        fontSize: 20.0, color: Colors.lightBlueAccent),
                  ),
                  new Text(
                    // Read the name field value and set it in the Text widget
                    "Titulo:- " + noticia[index].titulo,
                    // set some style to text
                    style: new TextStyle(fontSize: 20.0, color: Colors.amber),
                  ),
                ],
              )),
              padding: const EdgeInsets.all(15.0),
            ),
          );
        });
  }
}

List<Noticia> parseJson(String response) {
  if(response==null){
    return [];
  }
  final parsed =
  json.decode(response.toString()).cast<Map<String, dynamic>>();
  return parsed.map<Noticia>((json) => new Noticia().fromJson(json)).toList();
}
}
*/
