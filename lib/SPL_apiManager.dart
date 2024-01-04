import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sem_project_new/SoccerModel.dart';
// import 'package:sem_project_new/SPL_homepage.dart';

//for premier league

class SoccerApiSPL {
  // final String apiUrl = 'https://v3.football.api-sports.io/fixtures?live=all';
  final String apiUrl = 'https://v3.football.api-sports.io/fixtures?season=2023&league=307';
  // final String apiUrl = 'https://v3.football.api-sports.io/fixtures?season=all&league=39';


  //headers
  Map<String, String> headers = {
    'x-rapidapi-host': 'v3.football.api-sports.io',
    'x-rapidapi-key': '87407270ef8ad8cea1271ad368709e39',
  };

//arranged data
  Future<List<SoccerMatch>> getAllMatches() async {
    try {
      Response res = await get(Uri.parse(apiUrl), headers: headers);
      var body;
      if (res.statusCode == 200) {
        body = jsonDecode(res.body);
        List<dynamic> matchesList = body['response'];

        List<SoccerMatch> completedMatches = matchesList
            .where((match) =>
        match['fixture']['status']['short'] == 'FT' ||
            match['fixture']['status']['short'] == 'HT')
            .map((dynamic item) => SoccerMatch.fromJson(item))
            .toList();

        completedMatches.sort((a, b) {
          // Sort based on the 'date' field in the 'fixture' object
          DateTime dateA = DateTime.parse(a.fixture.date);
          DateTime dateB = DateTime.parse(b.fixture.date);
          return dateB.compareTo(dateA);
        });

        print('matches <<<< $completedMatches >>>> ');

        return completedMatches;
      } else {
        throw Exception(
            'Failed to load matches. Status code: ->-> ${res.statusCode}');
      }
    } catch (e) {
      // You can log the exception or handle it as needed
      print('Error is ->-> $e <-<-');
      throw Exception('Failed to load matches. <<<< Error: $e >>>>');
    }
  }
}
