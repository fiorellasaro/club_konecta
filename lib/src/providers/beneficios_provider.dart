import 'dart:convert';
import 'package:club_konecta/src/model/beneficios_model.dart';
import 'package:http/http.dart';

class HttpServiceBenefits {
  final String eventURL =
      "https://desarrollotest-592a0.firebaseio.com/Beneficio.json";

  Future<List<Beneficio>> getBenefits() async {
    Response res = await get(eventURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Beneficio> beneficio = body
          .map(
            (dynamic item) => Beneficio.fromJson(item),
          )
          .toList();

      return beneficio;
    } else {
      throw "Can't get benefits.";
    }
  }
}
