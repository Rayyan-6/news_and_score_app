
import 'package:flutter/material.dart';
import 'SoccerModel.dart';
import 'UI Pages/StatsPage.dart';
import 'UI Pages/matchDetails.dart';

class MatchTile extends StatefulWidget {
  final SoccerMatch match;

  const MatchTile(SoccerMatch allmatch, {Key? key, required this.match}) : super(key: key);

  @override
  _MatchTileState createState() => _MatchTileState();
}

class _MatchTileState extends State<MatchTile> {
  @override
  Widget build(BuildContext context) {
    DateTime matchDate = DateTime.parse(widget.match.fixture.date);
    String formattedDate =
        "${matchDate.day}/${matchDate.month}/${matchDate.year}";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // builder: (context) => matchDetails(match: widget.match),
            // builder: (context) => StatsPage(fixtureId: widget.match.fixture.id ?? 10, ),
            builder: (context) => StatsPage(fixtureId: widget.match.fixture.id!, ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            borderRadius: BorderRadius.circular(25.0)),
        height: 75,
        width: 100,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
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
                        " ${widget.match.status.elapsed}'",
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
                Expanded(
                  child: Text(
                    widget.match.home.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Image.network(widget.match.home.logoUrl, width: 36,height: 36,),
                Flexible(
                  child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(
                        "${widget.match.goal.home} - ${widget.match.goal.away}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Image.network(widget.match.away.logoUrl, width: 36,height: 36,),
                Expanded(
                  child: Text(
                    widget.match.away.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}