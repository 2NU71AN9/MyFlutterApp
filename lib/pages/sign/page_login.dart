import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui_kit/alert.dart';
import 'package:my_flutter_app/network/network_handler.dart';
import 'package:my_flutter_app/models/models_export.dart';
import 'package:my_flutter_app/services/user_data_service.dart';
import 'package:my_flutter_app/tabbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userNameCtr = TextEditingController();
  TextEditingController _passwordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    NetworkHandler.instance.ctx = context;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            "images/login_bg.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 50),
                    child: Image.asset("images/login_logo.png"),
                  ),
                  Row(
                    children: [
                      Image.asset("images/tab1_normal.png"),
                      Expanded(
                        child: Container(
                          height: 40,
                          child: TextField(
                            controller: _userNameCtr,
                            autofocus: true,
                            maxLength: 30,
                            decoration: InputDecoration(
                                counterText: "",
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintText: "请输入用户名",
                                hintStyle: TextStyle(fontSize: 15),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 0),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset("images/tab1_normal.png"),
                      Expanded(
                        child: Container(
                          height: 40,
                          child: TextField(
                            controller: _passwordCtr,
                            obscureText: true,
                            maxLength: 18,
                            decoration: InputDecoration(
                                counterText: "",
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintText: "请输入密码",
                                hintStyle: TextStyle(fontSize: 15),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 0),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      child: Text("登录"),
                      onPressed: () {
                        _loginAction();
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          StadiumBorder(
                              side: BorderSide(style: BorderStyle.none)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _loginAction() async {
    var username = _userNameCtr.text.trim();
    var password = _passwordCtr.text.trim();
    if (username.isEmpty || password.isEmpty) {
      SLAlert.toast("请补全信息");
      return;
    }
    var res = await NetworkHandler.request(API.login, parameters: {
      "username": username,
      "password": password,
      "client_id": "webApp",
      "client_secret": "webApp",
      "grant_type": "password",
      "scope": "app"
    });
    if (res.originData["access_token"] == null) {
      return;
    }
    final model = ModelLogin.fromJson(res.originData);
    UserDataService.shared.saveLoginData(model);
    UserDataService.shared.loadUserData().then((value) {
      goHomePage();
    }).catchError((e) {});
  }

  goHomePage() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return TabBarCtr();
    }), (route) {
      return false;
    });
  }
}
