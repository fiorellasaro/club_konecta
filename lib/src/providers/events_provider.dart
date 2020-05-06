

import 'dart:convert';
import 'package:http/http.dart';
import 'package:club_konecta/src/model/reconocimiento_model.dart';

class HttpService {
final String reconocimientoURL = "https://jsonplaceholder.typicode.com/posts";

Future<List<Reconocimiento>> getReconocimiento() async {
    Response res = await get(reconocimientoURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Reconocimiento> reconocimiento = body
          .map(
            (dynamic item) => Reconocimiento.fromJson(item),
          )
          .toList();

      return reconocimiento;
    } else {
      throw "Can't get posts.";
    }
  }

}