import 'dart:async';

import 'package:flutter/material.dart';

import 'MainScreen.dart';
import 'MainScreen_2.dart';
import 'MainScreen_3.dart';

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
      Duration(seconds: 10),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen_3()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "assets/FBfield.jpg", // Replace with the path to your background image
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to The Sports App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Image.asset("assets/splashgif.gif"),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


