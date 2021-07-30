import 'package:flutter/material.dart';

class HttpResult<T> {
  int? code;
  T? data;
  String? msg;
}
