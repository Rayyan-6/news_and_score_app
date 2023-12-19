import 'package:flutter/material.dart';

import 'AmericanNewsUI.dart';
import 'CricketNewsUI.dart';
import 'FootballIntro.dart';
import 'FootballNewsPage.dart';
import 'FootballNewsApiManagerI.dart';

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

      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,

            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return GestureDetector(
                  onTap: () {
                    navigateToPage(context, index);
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          getPageTitle(index),
                          style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: 4,
            ),
          ),
        ],
      ),
    );
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => FootballIntro()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsUI()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AmericanNewsUI()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => CricketNewsUI()));
        break;
    }
  }

  String getPageTitle(int index) {
    switch (index) {
      case 0:
        return 'Football Scores';
      case 1:
        return 'European Football News';
      case 2:
        return 'American Sports News';
      case 3:
        return 'Cricket News';
      default:
        return '';
    }
  }
}