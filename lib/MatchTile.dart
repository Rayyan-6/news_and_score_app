import 'package:flutter/material.dart';
import 'SoccerModel.dart';

Widget MatchTile(SoccerMatch match) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blueGrey[800],
      borderRadius: BorderRadius.circular(25.0)
    ),
    height: 65,
    width: 100,
    margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Expanded(
          child: Text(
        match.home.name,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),
      )),
      Image.network(match.home.logoUrl, width: 36),
      Flexible(
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text("${match.goal.home} - ${match.goal.away}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ),
     
      Image.network(match.away.logoUrl, width: 36),
      Expanded(
          child: Text(
        match.away.name,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),
      )),
    ]),
  );
}
