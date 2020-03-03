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

    print('请求地址：【' + method + '  ' + API_PREFIX + url + '】');
    print('请求参数：' + data.toString());

    Dio dio = createInstance();
    var result;

    try {
      if (method == GET) {
        // todo 奇怪的DIO，GET和POST的参数命名竟然不一样
        response = await dio.get(url, queryParameters: data);
        result = response.data;
      } else {
        response = await dio.request(url,
            data: data, options: new Options(method: method));
        result = response.data;
      }
    } on DioError catch (e) {
      print('请求错误:' + e.toString()); // todo:要抛出去给视图层
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
