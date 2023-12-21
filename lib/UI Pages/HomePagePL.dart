import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sem_project_new/UI%20Pages/PageBody.dart';
import 'package:sem_project_new/SoccerModel.dart';
import 'package:sem_project_new/apiManager.dart';
import 'package:sem_project_new/Basketball/api_manager_BB.dart';

import '../apiManagerPL.dart';

class HomePagePL extends StatefulWidget {
  const HomePagePL({super.key});
  @override
  State<HomePagePL> createState() => _HomePageStatePL();
}

class _HomePageStatePL extends State<HomePagePL> {
  List<Map<String, dynamic>> leagues = [];
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade400,
        title: Text("Premier League",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30
          ),


        ),
      ),
      body: FutureBuilder(

        //for premier league
        future: SoccerApiPL().getAllMatches(),//change for respective sport
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                  'Error loading data: Error print: ${snapshot.error} error end'),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            return PageBody(context,
                snapshot.data!,39); // Use the non-null assertion operator (!)
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}


