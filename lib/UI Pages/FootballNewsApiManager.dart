import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'generalNewsUI.dart';

class NewsUI extends StatefulWidget {
  @override
  _NewsUIState createState() => _NewsUIState();
}

class _NewsUIState extends State<NewsUI> {


  final List<String> apiEndpoints = [
    'https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
    'https://newsapi.org/v2/top-headlines?country=sg&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
    'https://newsapi.org/v2/top-headlines?country=ie&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
  ];

  List<dynamic> articles = [];

  @override
  Widget build(BuildContext context) {
    return generalNewsUI(title: 'Football News', apiEndpoints: apiEndpoints,);
  }
}