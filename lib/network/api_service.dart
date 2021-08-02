import 'package:my_flutter_app/services/user_data_service.dart';

enum API {
  login,
  userdata,
}

class APIService {
  API api;
  Map<String, dynamic>? parameters;
  APIService({required this.api, this.parameters});

  String get baseUrl {
    bool inProduction = const bool.fromEnvironment("dart.vm.product");
    if (inProduction) {
      return "https://app.globalquickseek.com:9300";
    } else {
      return "http://192.168.1.111:9300";
    }
  }

  String get path {
    switch (api) {
      case API.login:
        return "/api-auth/oauth/token";
      case API.userdata:
        return "/api-user/mobile/user/getLoginAppUser";
      default:
        return 'http://test_api.com/';
    }
  }

  Map<String, dynamic>? get header {
    switch (api) {
      case API.login:
        return null;
      default:
        var token = UserDataService.shared.loginData?.accessToken;
        if (token != null) {
          return {"Authorization": "Bearer $token"};
        } else {
          return {};
        }
    }
  }

  // 请求方式 GET POST PUT DELETE ...
  String get method {
    switch (api) {
      case API.userdata:
        return "GET";
      default:
        return "POST";
    }
  }

  String get contentType {
    switch (api) {
      case API.login:
      case API.userdata:
        return "application/x-www-form-urlencoded";
      default:
        return "application/json; charset=utf-8";
    }
  }

  bool get showLoading {
    switch (api) {
      default:
        return true;
    }
  }

  String? get responsePath {
    switch (api) {
      default:
        return null;
    }
  }
}
