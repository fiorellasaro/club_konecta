

import 'dart:convert';
import 'package:club_konecta/src/model/events_model.dart';
import 'package:http/http.dart';


class HttpServiceReconocimiento {
final String eventURL = "https://jsonplaceholder.typicode.com/posts";

Future<List<Event>> getReconocimientos() async {
    Response res = await get(eventURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Event> event = body
          .map(
            (dynamic item) => Event.fromJson(item),
          )
          .toList();

      return event;
    } else {
      throw "Can't get posts.";
    }
  }

}