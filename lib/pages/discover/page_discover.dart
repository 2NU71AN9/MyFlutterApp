import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  static const platform = const MethodChannel('my.flutter.io/battery');
  String _batteryLevel = '未知电量';

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("发现")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_batteryLevel),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _getBatteryLevel, child: Text("获取电量"))
          ],
        ),
      ),
    );
  }

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = "当前电量: $result%";
    } on PlatformException catch (e) {
      batteryLevel = "获取电量失败: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
