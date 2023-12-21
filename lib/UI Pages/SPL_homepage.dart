import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sem_project_new/UI%20Pages/PageBody.dart';
import 'package:sem_project_new/SoccerModel.dart';
import 'package:sem_project_new/apiManager.dart';
import 'package:sem_project_new/Basketball/api_manager_BB.dart';
import '../SPL_apiManager.dart';
import 'PageBodyBB.dart';

class HomePageSPL extends StatefulWidget {
  const HomePageSPL({super.key});
  @override
  State<HomePageSPL> createState() => _HomePageStateSPL();
}

class _HomePageStateSPL extends State<HomePageSPL> {
  List<Map<String, dynamic>> leagues = [];
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        centerTitle: true,
        backgroundColor: Colors.lime[600],
        title: Text("Saudi Pro League",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30
          ),
        ),
      ),
      body: FutureBuilder(
        //for premier league
        future: SoccerApiSPL().getAllMatches(),
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
                snapshot.data!,307); // Use the non-null assertion operator (!)
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


