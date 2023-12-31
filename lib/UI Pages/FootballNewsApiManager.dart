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
  // final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2';
  // final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=za&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2';
  // final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=nz&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2';
  // final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=ie&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2';
  // final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2';
  // final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2';
  // final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=sg&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2';
  // final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=ca&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2';

  final List<String> apiEndpoints = [
    'https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
    'https://newsapi.org/v2/top-headlines?country=sg&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
    'https://newsapi.org/v2/top-headlines?country=ie&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
  ];

  List<dynamic> articles = [];



  // Future<List<dynamic>> fetchData() async {
  //   try {
  //     List<dynamic> allArticles = [];
  //
  //     for (String apiUrl in apiEndpoints) {
  //       final response = await http.get(Uri.parse(apiUrl));
  //       if (response.statusCode == 200) {
  //         final Map<String, dynamic> data = json.decode(response.body);
  //         allArticles.addAll(data['articles']);
  //       } else {
  //         throw Exception('Failed to load data from $apiUrl');
  //       }
  //     }
  //
  //     allArticles.shuffle();
  //     return allArticles;
  //   } catch (error) {
  //     print('Error: $error');
  //     return [];
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

//////////////////////new UI.///////hui hui hui/////////////////////
  @override
  Widget build(BuildContext context) {
    return generalNewsUI(title: 'Football News', apiEndpoints: apiEndpoints,);

  }


}