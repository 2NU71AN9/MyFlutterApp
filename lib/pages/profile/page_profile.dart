import 'package:flutter/material.dart';
import 'package:my_flutter_app/services/user_data_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我的")),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              logout();
            },
            child: Text("退出登录")),
      ),
    );
  }

  logout() {
    UserDataService.shared.logout(context);
  }
}
