import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zepto_clone/core/locator.dart';
import 'package:zepto_clone/views/app/view.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  setupLocator();
  runApp(new MyApp());
}
