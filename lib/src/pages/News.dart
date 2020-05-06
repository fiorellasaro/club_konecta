import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'rating.dart';
import 'package:club_konecta/src/model/news_model.dart';
import 'package:club_konecta/src/providers/news_provider.dart';

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

class NewsAndBenefits extends StatelessWidget {
  final HttpServiceNews httpService = HttpServiceNews();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            heightFactor: 2.5,
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
          Container(
            child: Column(
/*          mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,*/
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                      /*    autoPlay: true,
                      aspectRatio: 2.0,*/
                      enlargeCenterPage: true,
                      height: 320),
                  items: imageSliders,
                ),
              ],
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
                (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
              if (snapshot.hasData) {
                List<News> posts = snapshot.data;

                return Column(
                  children: posts
                      .map(
                        (News post) => Card(
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
                                                'Beneficio ${post.id} ',
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
                                        post.title,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        post.body,
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
    );

    /*   floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
  }
}
