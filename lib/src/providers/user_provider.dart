import 'dart:convert';

import 'package:club_konecta/src/model/user_model.dart';
import 'package:http/http.dart';

class HttpServiceUser {
final String userURL = "https://jsonplaceholder.typicode.com/users";

Future<List<User>> getUsers() async {
    Response res = await get(userURL);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> user = body
          .map(
            (dynamic item) => User.fromJson(item),
          )
          .toList();
      return user;
    } else {
      throw "Can't get Users.";
    }
  }

}