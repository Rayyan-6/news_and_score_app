import 'package:flutter/material.dart';

import 'FootballIntro.dart';
import 'FootballNewsPage.dart';
import 'FootballNewsUI.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Scores App",
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[ GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FootballIntro()),
                      );                },
                    child: Container(
                      color: Colors.blue,
                        height: 200,
                        width: 150,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                          Text('Football Scores',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),)
                        ]))
                ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsUI()),
                        );                },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),

                      child: Container(
                          // padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            color: Colors.blue,
                            height: 200,
                            width: 150,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Text('Football News',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                    ),)
                                ])),
                      )
                  )]
              )
            ],
          ),
    );
  }
}
