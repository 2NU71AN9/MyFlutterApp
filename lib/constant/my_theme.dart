import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData get mainTheme {
    return ThemeData(
      // 主要颜色
      primarySwatch: Colors.red,
      // 主色，决定导航栏颜色
      primaryColor: Colors.white,
      // 次级色，决定大多数Widget的颜色，如进度条、开关等。
      accentColor: Colors.red,
      scaffoldBackgroundColor: Colors.white,
      // 字体主题
      textTheme: TextTheme(
          // headline6: TextStyle(
          //   color: Colors.red,
          //   fontSize: 12.0,
          // ),
          // 设置Material的默认字体样式
          // bodyText1: TextStyle(
          //   color: Colors.orange,
          //   fontSize: 15.0,
          // ),
          ),
      // Icon的默认样式
      // iconTheme: IconThemeData(
      //   color: Colors.yellow,
      //   size: 24.0,
      // ),
    );
  }
}
