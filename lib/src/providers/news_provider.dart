import 'dart:convert';
import 'package:club_konecta/src/model/news_model.dart';
import 'package:http/http.dart';

class HttpServiceNews {
  final String eventURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<News>> getNews() async {
    Response res = await get(eventURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<News> news = body
          .map(
            (dynamic item) => News.fromJson(item),
          )
          .toList();

      return news;
    } else {
      throw "Can't get news.";
    }
  }
}
