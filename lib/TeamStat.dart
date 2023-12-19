import 'package:flutter/material.dart';

Widget TeamStat(
  String team,
  String logourl,
  String teamName,
) //removed 4th srgument 'home'

{
  // List logourl1 =logourl.toString().split('io/');
  // String firstUrl = "https://media-4.api-sports.io/";
  // String secondUrl = logourl1[1];
  // print(secondUrl);

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
