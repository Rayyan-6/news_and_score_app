import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sem_project_new/Basketball/BasketballModel.dart';
import 'package:sem_project_new/SoccerModel.dart';

class BasketballApi{
  final String apiUrl = "https://v1.basketball.api-sports.io/games?live=all";
  Map<String, String> headers = {
    'x-rapidapi-host': 'v1.basketball.api-sports.io',
    'x-rapidapi-key': '87407270ef8ad8cea1271ad368709e39',
  };
  Future<List<BasketballMatch>> getAllMatches() async{
    try{
      Response res = await get(Uri.parse(apiUrl), headers: headers );
      var body;
      if (res.statusCode == 200) {
        body = jsonDecode(res.body);
        List<dynamic> matchesList = body['response'];
        debugPrint("Response is  ${body['response']}");
        List<BasketballMatch> matches = matchesList
            .map((dynamic item) => BasketballMatch.fromJson(item))
            .toList();
        print('macthes <<<< $matchesList >>>> '); // to debug

        return matches;
      } else {
        throw Exception(
            'Failed to load matches. Status code: ->-> ${res.statusCode}');
      }
    }
    catch (e) {
      print('Error in getAllMatches: ->->$e');
      throw Exception('Failed to load matches. <<<< Error: $e >>>>');
    }
  }
}