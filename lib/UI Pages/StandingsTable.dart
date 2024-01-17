import 'dart:convert';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../adsPage.dart';

class StandingsTable extends StatefulWidget {
  final int leagueId;

  StandingsTable({required this.leagueId});

  @override
  _StandingsTableState createState() => _StandingsTableState();
}

class _StandingsTableState extends State<StandingsTable> {

  // late List<StandingsTeam> standings;
   List<StandingsTeam> standings=[];
   BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    fetchStandingsData();
    _createBanner();
  }

  Future<void> fetchStandingsData() async {
    final apiUrl = 'https://v3.football.api-sports.io/standings?season=2023&league='+'${widget.leagueId}';
    final headers = {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '87407270ef8ad8cea1271ad368709e39',
    };

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final standingsData = body['response'][0]['league']['standings'][0];

        setState(() {
          standings = List<StandingsTeam>.from(
            standingsData.map((teamData) => StandingsTeam.fromJson(teamData)),
          );
        });
      } else {
        throw Exception('Failed to load standings. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

   void _createBanner() {
     _bannerAd = BannerAd(
         size: AdSize.fullBanner,
         adUnitId: AdMobService.bannerAdUnitId!,
         listener: AdMobService.bannerAdListener,
         request: const AdRequest())
       ..load();
   }
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
           iconTheme: const IconThemeData(
             color: Colors.white,
             size: 30
           ),
           centerTitle: true,
           backgroundColor: Colors.transparent,
           title: Text('Standings Table',style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold,
             fontSize: 30

           ),),
         ),
         body: Container(

           child: standings != null
               ? ListView.builder(
             itemCount: standings.length,
             itemBuilder: (context, index) {
               StandingsTeam team = standings[index];
               return Card(
                 // color: Colors.transparent,
                 color: Color.fromRGBO(0, 0, 0, 0.5),
                 margin: EdgeInsets.all(8),
                 child: ListTile(
                   leading: Text(
                     "${index + 1}",
                     style: TextStyle(fontSize: 25,
                         color: Colors.white
                     ),
                   ),
                   trailing: Image.network(
                     team.logo,
                     width: 36,
                     height: 36,
                   ),
                   title: Text(team.teamName,
                     style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold
                     ),),
                   subtitle: Text(
                     'Played: ${team.played} | Won: ${team.won} | Draw: ${team.draw} | Lost: ${team.lost} | Points: ${team.points}',
                     style: TextStyle(
                         color: Colors.white,
                         // fontWeight: FontWeight.bold
                     ),
                   ),
                 ),
               );
             },
           )
               : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),)),
         ),
         bottomNavigationBar: (_bannerAd == null)
             ? Container(
           color: Colors.white,
           height: 60,
           width: 470,)
             : SizedBox(
           height: 60,
           width: 470,
           child: AdWidget(ad: _bannerAd!),
         ),
       ),
     );
   }
}

class StandingsTeam {
  final String teamName;
  final String logo;
  final int played;
  final int won;
  final int draw;
  final int lost;
  final int points;

  StandingsTeam({
    required this.teamName,
    required this.logo,
    required this.played,
    required this.won,
    required this.draw,
    required this.lost,
    required this.points,
  });

  factory StandingsTeam.fromJson(Map<String, dynamic> json) {
    return StandingsTeam(
      teamName: json['team']['name'],
      logo: json['team']['logo'] ?? Image.asset("assets/pl.png"),
      played: json['all']['played'],
      won: json['all']['win'],
      draw: json['all']['draw'],
      lost: json['all']['lose'],
      points: json['points'],
    );
  }
}