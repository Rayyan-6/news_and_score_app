import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sem_project_new/UI%20Pages/FootballIntro.dart';
import 'package:sem_project_new/UI%20Pages/MainScreen_2.dart';
// import 'package:sem_project_new/UI%20Pages/MyHomePage.dart';
import 'package:sem_project_new/UI%20Pages/SplashScreen.dart';
import 'package:sem_project_new/UI%20Pages/StandingsIntro.dart';
// import 'package:sem_project_new/UI%20Pages/api_2.dart';

import 'UI Pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   SplashScreen(),
    );
  }
}
