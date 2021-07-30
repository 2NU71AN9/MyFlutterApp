import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'constant/my_theme.dart';
import 'tabbar.dart';
import 'pages/sign/page_login.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: TabBarCtr(),
      home: LoginPage(),
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
