import 'package:flutter/material.dart';
import 'package:sem_project_new/Goalstat.dart';
import 'package:sem_project_new/MatchTile.dart';
import 'package:sem_project_new/TeamStat.dart';
import '../SoccerModel.dart';

Widget PageBody(List<SoccerMatch> allmatches) {//changes made
  return Column(
      children: [
        // const Text("",
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontSize: 20,
        //   ),),
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
