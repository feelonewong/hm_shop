import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

Widget getRootWideget() {
  return MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: getRootRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    '/': (context) => MainPage(), // 首页
    '/login': (context) => LoginPage(),
  };
}
