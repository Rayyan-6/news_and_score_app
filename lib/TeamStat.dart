import 'package:flutter/material.dart';

Widget TeamStat(
  String team,
  String logourl,
  String teamName,
) //removed 4th srgument 'home'

{


  return Expanded(
      child: Column(
    children: [
      Text(team),
      const SizedBox(height: 10),
      Expanded(
        child: Image.network(logourl.toString().toLowerCase(), width: 54) ?? Image.asset("assets/test.png"),
      ),
      const SizedBox(height: 10),
      Text(teamName),
    ],
  ));
}
