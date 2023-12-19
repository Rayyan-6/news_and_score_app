import 'package:flutter/material.dart';

Widget GoalStat(int expandedtime, int homegoal, int awaygoal) { //added ? null safety then removed
  return Expanded(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("$expandedtime'"),
      Expanded(child: Center(child: Text("$homegoal - $awaygoal",
        style: TextStyle(
          fontSize: 26
        ),
      )))
    ],
  ));
}
