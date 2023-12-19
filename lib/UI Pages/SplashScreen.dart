import 'dart:async';

import 'package:flutter/material.dart';

import 'MainScreen.dart';
import 'MainScreen_2.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delayed navigation to the main screen after 5 seconds
    Timer(
      Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen_2()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 200.0,
        ),
      ),
    );
  }
}