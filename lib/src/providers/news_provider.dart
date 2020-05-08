import 'dart:convert';
import 'package:club_konecta/src/model/news_json_model.dart';
import 'package:http/http.dart';

class HttpServiceNews {
  final String eventURL =
      "https://desarrollotest-592a0.firebaseio.com/Noticia.json";

  Future<List<Noticia>> getNews() async {
    Response res = await get(eventURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Noticia> noticia = body
          .map(
            (dynamic item) => Noticia.fromJson(item),
          )
          .toList();

      return noticia;
    } else {
      throw "Can't get news.";
    }
  }
}
