
import 'package:flutter/material.dart';
import 'package:latest_news_app/view/news_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate some loading time, e.g., fetching data or initializing resources
    Future.delayed(Duration(seconds: 3), () {
      // After loading, navigate to the main screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => NewsScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Image.asset('assets/jk.jpeg'), // Use your image path
      ),

    );
  }
}