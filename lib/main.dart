import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'constant/my_theme.dart';
import 'pages/sign/page_login.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:my_flutter_app/services/user_data_service.dart';
import 'package:my_flutter_app/tabbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserDataService.shared.loadLoginDataFromDisk();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserDataService.shared.isLogin ? TabBarCtr() : LoginPage(),
      builder: BotToastInit(),
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      theme: MyTheme.mainTheme,
    );
  }
}
