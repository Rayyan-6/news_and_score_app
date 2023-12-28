import 'package:flutter/material.dart';
import 'SoccerModel.dart';

Widget MatchTile(SoccerMatch match) {

  DateTime matchDate = DateTime.parse(match.fixture.date);
  String formattedDate =
      "${matchDate.day}/${matchDate.month}/${matchDate.year}";

  return Container(
    decoration: BoxDecoration(
      // color: Colors.blueGrey[800],
        color: Color.fromRGBO(0, 0, 0, 0.5),
      borderRadius: BorderRadius.circular(25.0)
    ),
    height: 75,
    width: 100,
    margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
    child: Column(
      children:[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
                           Text(
                                      formattedDate,
                                        style: TextStyle(
                                               color: Colors.white,
                                               fontSize: 12,
                                               fontWeight: FontWeight.bold,
                                        ),
                                               ),
                  Expanded(
                    child: Padding(
                     padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                     child: Text(


                          " ${match.status.elapsed}'",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                                   ),
                  ),



            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      //     Text(
      // formattedDate,
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontSize: 14,
      //     fontWeight: FontWeight.bold,
      //   ),
      //     ),
        Expanded(
            child: Text(
          match.home.name,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white,
              fontSize: 13,
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
              fontSize: 13,
              fontWeight: FontWeight.bold
          ),
        )),
      ]),
      ]
    ),
  );
}
