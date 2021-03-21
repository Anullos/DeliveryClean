import 'package:delivery_thema/ui/splash/splash_page.dart';
import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery Theme',
      theme: darkTheme,
      home: SplashPage(),
    );
  }
}

