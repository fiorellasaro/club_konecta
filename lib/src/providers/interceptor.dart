import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      data.headers["Content-Type"] = "application/json";
      data.headers['Authorization'] = 'Bearer ${prefs.getString('token')}';
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async => data;
}