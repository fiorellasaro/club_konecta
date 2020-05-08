import 'package:flutter/material.dart';
import 'package:club_konecta/src/model/kuentanos_model.dart';
import 'package:club_konecta/src/providers/kuentanos_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class KuentanosPage extends StatelessWidget {
  final HttpServiceKuentanos httpService = HttpServiceKuentanos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            getHeader(),
            Expanded(
              child: FutureBuilder(
                future: httpService.getEncuentas(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Kuentanos>> snapshot) {
                  if (snapshot.hasData) {
                    List<Kuentanos> posts = snapshot.data;
                    return ListView(
                      children: posts
                          .map(
                            (Kuentanos post) => InkWell(
                              onTap: () => launch(post.url),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 20),
                                child: Column(
                                  children: <Widget>[
                                    FadeInImage(
                                      placeholder:
                                          AssetImage('assets/original.gif'),
                                      image: NetworkImage(post.img),
                                      fadeInDuration:
                                          Duration(milliseconds: 200),
                                    //  height: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.link),
                                          Text(
                                            post.title,
                                            style: TextStyle(
                                              fontFamily: 'Monserrate',
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
          ],
        ),
      ),
    );
  }

  Widget getHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        'Comparte como te encuentras con nosotros',
        style: TextStyle(
          fontFamily: 'Monserrate',
          fontSize: 15,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}