import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sem_project_new/UI%20Pages/PageBody.dart';
import 'package:sem_project_new/SoccerModel.dart';
import 'package:sem_project_new/apiManager.dart';
import 'package:sem_project_new/Basketball/api_manager_BB.dart';

import '../apiManager_BndLiga.dart';

class HomePageBndLiga extends StatefulWidget {
  const HomePageBndLiga({super.key});
  @override
  State<HomePageBndLiga> createState() => _HomePageStateBndLiga();
}
//
// class _HomePageStateBndLiga extends State<HomePageBndLiga> {
//   List<Map<String, dynamic>> leagues = [];
//   bool isLoading = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal[100],
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//             color: Colors.white
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.teal[600],
//         title: Text("Bundes Liga",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 30
//           ),
//
//
//         ),
//       ),
//       body: FutureBuilder(
//
//         //for premier league
//         future: SoccerApiBndLiga().getAllMatches(),//change for respective sport
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                   'Error loading data: Error print: ${snapshot.error} error end'),
//             );
//           } else if (snapshot.hasData && snapshot.data != null) {
//             return PageBody(context,
//                 snapshot.data!); // Use the non-null assertion operator (!)
//           } else {
//             return Center(
//               child: Text('No data available'),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

class _HomePageStateBndLiga extends State<HomePageBndLiga> {
  List<Map<String, dynamic>> leagues = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/FBfield.jpg"),
          fit: BoxFit.cover,
        )
        ,),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Bundes Liga",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        body: FutureBuilder(
          //for premier league
          future: SoccerApiBndLiga().getAllMatches(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),));
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                    'Error loading data: Error print: ${snapshot.error} error end'),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              return PageBody(context, snapshot.data!);
            } else {
              return Center(
                child: Text('No data available'),
              );
            }
          },
        ),

      ),
    );
  }
}



