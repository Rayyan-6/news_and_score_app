import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sem_project_new/UI%20Pages/PageBody.dart';
import 'package:sem_project_new/SoccerModel.dart';
import 'package:sem_project_new/apiManager.dart';
import 'package:sem_project_new/Basketball/api_manager_BB.dart';
import 'package:sem_project_new/apiManagerSerieA.dart';
import '../LaligaApiManager.dart';
import '../SPL_apiManager.dart';
import 'PageBodyBB.dart';

class HomePageSerieA extends StatefulWidget {
  const HomePageSerieA({super.key});
  @override
  State<HomePageSerieA> createState() => _HomePageStateSerieA();
}

class _HomePageStateSerieA extends State<HomePageSerieA> {
  List<Map<String, dynamic>> leagues = [];
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text("Serie A",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30
          ),


        ),
      ),
      body: FutureBuilder(
        //for premier league
        future: SoccerApiSerieA().getAllMatches(),//change for respective sport
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                  'Error loading data: Error print: ${snapshot.error} error end'),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            return PageBody(
                snapshot.data!); // Use the non-null assertion operator (!)
          } else {
            return Center(
              child: Text('No data available',),
            );
          }
        },
      ),
    );
  }
}


