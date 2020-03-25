import 'package:dio/dio.dart';
import 'dart:async';

const String HOST_URL = 'https://www.dkhs.com';

class Http {
  static Dio dio;
  // todo:要改成可切换配置
  static const String API_PREFIX = HOST_URL + '/api/v1';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 5000;

  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  static Future<dynamic> request(String url, {data, method}) async {
    data = data ?? {'_id': 1}; // todo get时，这个data还不能是空对象
    method = method ?? GET;
    Response response;
    data.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    Dio dio = createInstance();
    var result;
    print('请求地址：【' + method + '  ' + API_PREFIX + url + '】');
    try {
      if (method == GET) {
        // todo 奇怪的DIO，GET和POST的参数命名竟然不一样
        response = await dio.get(url, queryParameters: data);
        var errorObj = response.data['errors'] as Map;
        if (errorObj != null) {
          {
            errorObj.forEach((k, v) => throw Exception('$v'));
          }
        }
        result = response.data;
      } else {
        response = await dio.request(url,
            data: data, options: new Options(method: method));
        result = response.data;
      }
    } on DioError catch (e) {
      if (e.response == null) {
        throw Exception('500:数据请求失败');
      }
      var statusCode = e.response.statusCode;
      if (statusCode == 404) {
        throw Exception('404:接口请求路径有误');
      }
      print('请求地址：【' + method + '  ' + API_PREFIX + url + '】');
      print('请求参数：' + data.toString());
      throw e;
    }

    return result;
  }

  static Dio createInstance() {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: API_PREFIX,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );

      dio = new Dio(options);

      // dio.interceptors
      //     .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      //   print('send request：path:${options.uri}，baseURL:${options.baseUrl}');
      // }));
    }

    return dio;
  }

  static get(url, {data}) async => request(url, method: Http.GET, data: data);

  static clear() {
    dio = null;
  }
}
