
import 'package:flutter/material.dart';
import 'package:sem_project_new/Goalstat.dart';
import 'package:sem_project_new/MatchTile.dart';
import 'package:sem_project_new/TeamStat.dart';
import '../SoccerModel.dart';
import 'StandingsTable.dart';

Widget PageBody(BuildContext context,List<SoccerMatch> allmatches) {//int leagueId added
  return Column(
      children: [

        Expanded(
          child: ListView.builder(
            itemCount: allmatches.length,
            itemBuilder: (context, index) {
              // return MatchTile(allmatches[index]);
              return MatchTile(allmatches[index], match: allmatches[index],);
            },
          ),
        )
      ]
  );
}
