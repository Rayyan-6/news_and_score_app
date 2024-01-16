import 'package:flutter/material.dart';
import 'package:sem_project_new/SoccerModel.dart';

class matchDetails extends StatefulWidget {
  final SoccerMatch match;

  const matchDetails({Key? key, required this.match}) : super(key: key);

  @override
  State<matchDetails> createState() => _matchDetailsState();
}

class _matchDetailsState extends State<matchDetails> {

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/FBfield.jpg"),
          fit: BoxFit.cover,
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(

          iconTheme: const IconThemeData(
            size: 30,
            color: Colors.white,

          ),
          centerTitle: true,
          title:  const Text(
            "Match Details",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  color:  Color.fromRGBO(0, 0, 0, 0.5),
                  child: Container(
                    height: 150,
                    width: 300,
                    child: Column(children:[
                      Text('Home Team',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                        
                            Text(widget.match.home.name,style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                            SizedBox(width: 10,),
                        
                            Image.network(widget.match.home.logoUrl, width: 40),
                          ]
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Goals',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(width: 10,),
                          Text('${widget.match.goal.home}',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight:FontWeight.bold,
                          ),),
                        ],
                      )


                    ]),
                  ),
                ),
                SizedBox(height: 10,),
                Card(
                  color:  Color.fromRGBO(0, 0, 0, 0.5),
                  child: Container(
                    height: 150,
                    width: 300,
                    child: Column(children:[
                      Text('Away Team',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),

                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[

                              Text(widget.match.away.name,style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(width: 10,),

                              Image.network(widget.match.away.logoUrl, width: 40),
                            ]
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Goals',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(width: 10,),
                          Text('${widget.match.goal.away}',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight:FontWeight.bold,
                          ),),
                        ],
                      )


                    ]),
                  ),
                ),
                SizedBox(height: 10,),
                Card(
                  color:  Color.fromRGBO(0, 0, 0, 0.5),
                  child: Container(
                    height: 150,
                    width: 300,
                    child: Column(children:[
                      Text('Venue',style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text(widget.match.venue.name+','+widget.match.venue.city,
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),]
                        ),
                      ),

                    ]),
                  ),
                )



              ],
            )
          ),

      ),
    );
  }
}

