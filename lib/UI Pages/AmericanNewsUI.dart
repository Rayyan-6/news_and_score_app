import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'generalNewsUI.dart';

class AmericanNewsUI extends StatefulWidget {
  @override
  _AmericanNewsUIState createState() => _AmericanNewsUIState();
}

class _AmericanNewsUIState extends State<AmericanNewsUI> {

  final List<String> apiEndpoints = [
    'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
    'https://newsapi.org/v2/top-headlines?country=ca&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
  ];
  // Initialize a list to store articles
  List<dynamic> articles = [];

  //////////////////////new UI.///////hui hui hui/////////////////////
  @override
  Widget build(BuildContext context) {
    return generalNewsUI(title: 'American News', apiEndpoints: apiEndpoints,);

    //container
  }
}