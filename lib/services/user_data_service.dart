import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/model_login.dart';
import 'package:my_flutter_app/models/models_export.dart';
import 'package:my_flutter_app/network/network_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_flutter_app/pages/sign/page_login.dart';

class UserDataService with ChangeNotifier {
  ModelLogin? loginData;
  ModelUser? userData;
  SharedPreferences? _prefs;

  static final UserDataService shared = UserDataService._internal();
  factory UserDataService() => shared;
  UserDataService._internal() {
    init();
  }
  void init() {}

  bool get isLogin {
    return loginData?.accessToken != null;
  }

  // 获取本地保存的登录信息, App初始化时调用
  loadLoginDataFromDisk() async {
    _prefs = await SharedPreferences.getInstance();
    var str = _prefs?.getString('LoginData');
    if (str != null) {
      loginData = ModelLogin.fromJson(json.decode(str));
    }
  }

  //保存登录信息
  saveLoginData(ModelLogin loginData) {
    this.loginData = loginData;
    _prefs?.setString('LoginData', json.encode(loginData.toJson()));
  }

  // 网络获取用户信息
  Future<ModelUser?> loadUserData() async {
    var res = await NetworkHandler.request(API.userdata);
    if (!res.isSuccess) {
      throw Error();
    }
    userData = ModelUser.fromJson(res.data);
    notifyListeners();
    return userData;
  }

  // 测试provider用
  editUsername(String name) {
    userData = userData?.copyWith(username: name);
    notifyListeners();
  }

  // 退出登录 context控制跳转登录页
  logout(BuildContext? context) {
    loginData = null;
    userData = null;
    _prefs?.remove('LoginData');
    if (context != null) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      }), (route) {
        return false;
      });
    }
  }
}
