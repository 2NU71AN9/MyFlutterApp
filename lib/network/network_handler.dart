import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/services/user_data_service.dart';
import 'http_response.dart';
import 'api_service.dart';
import 'package:my_flutter_app/ui_kit/alert.dart';
import 'package:logger/logger.dart';
export 'api_service.dart';
export 'http_response.dart';

typedef OnFailure = void Function(HttpResponse response);

class NetworkHandler {
  static final NetworkHandler instance = NetworkHandler._internal();
  factory NetworkHandler() => instance;
  BuildContext? ctx;

  NetworkHandler._internal() {
    init();
  }

  Dio? _dio;

  init() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: "",
        connectTimeout: 5000,
        responseType: ResponseType.json,
        validateStatus: (code) {
          return HttpResponse.successCode.contains(code);
        });
    _dio = Dio(baseOptions);
    _dio?.interceptors.add(CustomInterceptors());
  }

  static Future<HttpResponse> request(API api,
      {Map<String, dynamic>? parameters, OnFailure? failure}) async {
    var service = APIService(api: api, parameters: parameters);
    NetworkHandler.instance._dio?.options.baseUrl = service.baseUrl;
    NetworkHandler.instance._dio?.options.headers = service.header;
    NetworkHandler.instance._dio?.options.contentType = service.contentType;
    NetworkHandler.instance._dio?.options.method = service.method;

    var cancel;
    if (service.showLoading) {
      cancel = SLAlert.loading();
    }

    try {
      var response = await NetworkHandler.instance._dio
          ?.request(service.path, queryParameters: service.parameters);
      if (service.showLoading) {
        cancel();
      }
      return HttpResponse.fromJSON(response?.data);
    } on DioError catch (e) {
      if (service.showLoading) {
        cancel();
      }
      if (e.response != null) {
        SLAlert.toast(e.response?.statusMessage);
        final res = HttpResponse.fromJSON(e.response?.data);
        if (failure != null) {
          failure(res);
        }
        if (HttpResponse.logoutCode.contains(res.code) &&
            NetworkHandler.instance.ctx != null) {
          UserDataService.shared.logout(NetworkHandler.instance.ctx!);
        }
        return res;
      } else {
        SLAlert.toast(e.message);
        final res = HttpResponse();
        if (failure != null) {
          failure(res);
        }
        return res;
      }
    }
  }
}

class CustomInterceptors extends Interceptor {
  final logger = Logger();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d(
        '网络请求[${options.method}] => 地址: ${options.baseUrl}${options.path}\n参数: ${options.queryParameters}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
        '请求成功[${response.statusCode}] => 地址: ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    if (kDebugMode) {
      log("返回数据: $response");
    }
    final res = HttpResponse.fromJSON(response.data);
    if (!res.isSuccess) {
      SLAlert.toast(res.message);
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.d(
        '请求失败[${err.response?.statusCode}] => 地址: ${err.requestOptions.baseUrl}${err.requestOptions.path}\n返回数据: ${err.toString()}');
    if (err.response?.data is Map) {
      var dict = (err.response?.data as Map<String, dynamic>);
      SLAlert.toast(dict["message"] ?? dict["resp_msg"]);
    }
    return super.onError(err, handler);
  }
}
