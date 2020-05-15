import 'dart:convert';
// import 'package:club_konecta/src/model/user_model.dart';
import 'package:http/http.dart';
// import 'package:http_interceptor/http_interceptor.dart';
// import 'package:club_konecta/src/providers/interceptor.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:club_konecta/src/model/login_model.dart';

class HttpServiceActivateAccount {
  final String loginURL = "http://172.57.154.18/clubkonecta/v2/user/signup";

  // Future<bool> setToken(String value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setString('token', value);
  // }

  // Future<String> getToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('token');
  // }

  Future<bool> activateAccount(Map data) async {
    print('future activte');
    var jsonResponse;
    var response = await post(
      loginURL,
      body: data,
    );
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      // setToken(jsonResponse['token']);
      return Future<bool>.value(true);
    } else {
      print('flse');
      return Future<bool>.value(false);
    }
  }

  // Future<User> getUserData() async {
  //   User colaborador;
  //   try {
  //     var response =
  //         await HttpWithInterceptor.build(interceptors: [LoggingInterceptor()])
  //             .get(loginURL);
  //     if (response.statusCode == 200) {
  //       colaborador = User.fromJson(json.decode(response.body));
  //     } else {
  //       throw Exception("Error while fetching. \n ${response.body}");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return colaborador;
  // }
}
