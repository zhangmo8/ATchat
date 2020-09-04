import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterdemo/config/api.config.dart';

BaseOptions _options = BaseOptions(
  baseUrl: config.serverUrl,
  responseType: ResponseType.plain,
);

Dio http = Dio(_options)
  ..interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions request) async {
      // 设置请求头token
      if (request.headers != null || request.headers["Authorization"]) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        String token = pref.getString("token") ?? "";
        if (token != "") {
          request.headers['Authorization'] = token;
        } 
      }

      /// 去除空参数
      if (request.data != null && (request.data is Map)) {
        List keys = request.data.keys.toList();
        for (var i = 0; i < keys.length; i++) {
          String key = keys[i];
          if (request.data[key] == null) request.data.remove(key);
          if (request.data[key] == '') request.data.remove(key);
        }
      }
      if (request.queryParameters != null) {
        List<String> keys = request.queryParameters.keys.toList();
        for (var i = 0; i < keys.length; i++) {
          String key = keys[i];
          if (request.queryParameters[key] == null)
            request.queryParameters.remove(key);
          if (request.queryParameters[key] == '')
            request.queryParameters.remove(key);
        }
      }
      return request;
    },
    onResponse: (Response response) async {
      print("11111111  "+response.headers.toString());
      return http.resolve(response);
    },
    onError: (DioError err) async {
      return http.reject(err);
    },
  ));
