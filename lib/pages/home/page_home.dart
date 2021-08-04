import 'package:flutter/material.dart';
import 'package:my_flutter_app/services/user_data_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(userData.userData?.username ?? "3333"),
          // Text(context.watch<UserDataService>().userData?.username ?? "123"),
          ElevatedButton(
              onPressed: () {
                context.read<UserDataService>().editUsername("我是李四");
              },
              child: Text("修改名字")),
          ElevatedButton(
              onPressed: () {
                context.read<UserDataService>().editUsername("我是王五");
              },
              child: Text("修改名字"))
        ],
      )),
    );
  }
}
