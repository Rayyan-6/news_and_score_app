import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sem_project_new/SoccerModel.dart';

//for premier league

class SoccerApiBndLiga {
  // final String apiUrl = 'https://v3.football.api-sports.io/fixtures?live=all';
  final String apiUrl = 'https://v3.football.api-sports.io/fixtures?season=2023&league=78';
  // final String apiUrl = 'https://v3.football.api-sports.io/fixtures?season=all&league=39';


  //headers
  Map<String, String> headers = {
    'x-rapidapi-host': 'v3.football.api-sports.io',
    'x-rapidapi-key': '87407270ef8ad8cea1271ad368709e39',
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    try {
      Response res = await get(Uri.parse(apiUrl), headers: headers );
      var body;
      if (res.statusCode == 200) {
        // print('Api service ${res.body} and ooo'); // to debug
        body = jsonDecode(res.body);
        List<dynamic> matchesList = body['response'];
        debugPrint("->_> ${body['response']}");
        // print('Api service ${body} and ${matchesList}'); // to debug
        // print('Api service $body '); // to debug
        List<SoccerMatch> matches = matchesList
            .map((dynamic item) => SoccerMatch.fromJson(item))
            .toList();
        print('macthes <<<< $matches >>>> '); // to debug

        return matches;
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
