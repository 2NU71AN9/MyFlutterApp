import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'api.dart';
import 'api_service.dart';
import 'package:my_flutter_app/ui_kit/alert.dart';

/// 请求异常的回调函数类型
typedef OnFailure = void Function(HttpResult response);

class NetworkHandler {
  static final NetworkHandler _instance = NetworkHandler._internal();
  factory NetworkHandler() => _instance;

  NetworkHandler._internal() {
    init();
  }

  Dio? _dio;

  init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "",
      connectTimeout: 5000,
      responseType: ResponseType.json,
    );
    _dio = Dio(baseOptions);
  }

  static request(API api, {Map<String, dynamic>? parameters}) async {
    var service = APIService(api: api, parameters: parameters);
    NetworkHandler._instance._dio?.options.baseUrl = service.baseUrl;
    NetworkHandler._instance._dio?.options.headers = service.header;
    NetworkHandler._instance._dio?.options.contentType = service.contentType;
    NetworkHandler._instance._dio?.options.method = service.method;

    var cancel;
    if (service.showLoading) {
      cancel = SLAlert.loading();
    }
    Response? response;
    try {
      response = await NetworkHandler._instance._dio
          ?.request(service.path, queryParameters: service.parameters);
    } on DioError catch (e) {
      if (e.response != null) {
        SLAlert.toast(e.response?.statusMessage);
      } else {
        SLAlert.toast(e.message);
      }
    }
    if (service.showLoading) {
      cancel();
    }
    print(response);
  }
}
