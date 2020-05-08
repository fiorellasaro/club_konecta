

import 'dart:convert';

import 'package:club_konecta/src/model/reconocimiento_model.dart';
import 'package:http/http.dart';


class HttpServiceReconocimiento {
final String reconocimientoURL = "https://desarrollotest-592a0.firebaseio.com/Reconocimiento.json";

Future<List<Reconocimiento>> getReconocimientos() async {
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