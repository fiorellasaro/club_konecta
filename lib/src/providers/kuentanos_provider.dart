import 'dart:convert';
import 'package:club_konecta/src/model/kuentanos_model.dart';
import 'package:http/http.dart';


class HttpServiceKuentanos {
final String kuentanosURL = "https://desarrollotest-592a0.firebaseio.com/Encuesta.json";

Future<List<Kuentanos>> getEncuentas() async {
    Response res = await get(kuentanosURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Kuentanos> kuentanos = body
          .map(
            (dynamic item) => Kuentanos.fromJson(item),
          )
          .toList();

      return kuentanos;
    } else {
      throw "Can't get posts.";
    }
  }

}