class HttpResponse {
  int code = 300;
  String? message;
  dynamic data;
  late Map<String, dynamic> originData;

  static var successCode = [0, 200];
  static var logoutCode = [401, 14006];

  // 网络请求是否成功
  bool get isSuccess {
    return successCode.contains(code);
  }

  HttpResponse();
  factory HttpResponse.fromJSON(dynamic json) {
    final response = HttpResponse();
    if ((json is Map) == false) {
      return response;
    }
    final dict = (json as Map<String, dynamic>);
    response.originData = dict;
    response.code = dict["code"] ?? dict["resp_code"] ?? 300;
    response.message = dict["message"] ?? dict["msg"] ?? dict["resp_msg"];
    response.data = dict["data"] ?? dict["datas"] ?? dict["odata"];
    return response;
  }
}
