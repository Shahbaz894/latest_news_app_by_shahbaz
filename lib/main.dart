import 'package:flutter/material.dart';

import 'package:latest_news_app/view/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

          home:  SplashScreen(),
        );

  }
}
