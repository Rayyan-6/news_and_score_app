import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sem_project_new/UI%20Pages/FootballNewsApiManager.dart';

import '../WebView.dart';
import 'generalNewsUI.dart';

class CricketNewsUI extends StatefulWidget {
  @override
  _CricketNewsUIState createState() => _CricketNewsUIState();
}


class _CricketNewsUIState extends State<CricketNewsUI> {
  final List<String> apiEndpoints = [
    'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',

  ];
  @override
  Widget build(BuildContext context) {
    return generalNewsUI(title: 'Cricket News', apiEndpoints: apiEndpoints,);
    //container
  }
}