
import 'package:flutter/material.dart';
import 'package:sem_project_new/Goalstat.dart';
import 'package:sem_project_new/MatchTile.dart';
import 'package:sem_project_new/TeamStat.dart';
import '../SoccerModel.dart';
import 'StandingsTable.dart';

Widget PageBody(BuildContext context,List<SoccerMatch> allmatches) {//int leagueId added
  return Column(
      children: [
        // const Text("matches",
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontSize: 20,
        //   ),),

        // ElevatedButton(
        //
        //     onPressed: (){
        //       Navigator.push(
        //         context,
        //         // MaterialPageRoute(builder: (context) => PageScreen(text, color)),
        //         MaterialPageRoute(builder: (context) => StandingsTable(leagueId: leagueId)),
        //       );
        // },
        //     child: Text("Standings")
        //
        // ),
        Expanded(
          child: ListView.builder(
            itemCount: allmatches.length,
            itemBuilder: (context, index) {
              return MatchTile(allmatches[index]);
            },
          ),
        )
      ]
  );
}
