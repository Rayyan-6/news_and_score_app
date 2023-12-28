import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sem_project_new/SoccerModel.dart';
import 'HomePage.dart';
import 'HomePageBndLiga.dart';
import 'HomePageLigue1.dart';
import 'HomePageMLS.dart';
import 'HomePagePL.dart';
import 'HomePageUCL.dart';
import 'HomePagesSerieA.dart';
import 'LaligaHomePage.dart';
import 'PageBody.dart';
import 'SPL_homepage.dart';
import 'StandingsIntro.dart';


class FootballIntro extends StatefulWidget {
  const FootballIntro({super.key});

  @override
  State<FootballIntro> createState() => _FootballIntroState();
}

class _FootballIntroState extends State<FootballIntro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/FBfielddark.png"),
          fit: BoxFit.cover,
        )
        ,),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Drawer(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  'Options',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                // contentPadding: EdgeInsets.symmetric(horizontal: 90.0),
                contentPadding: EdgeInsets.only(left: 90.0, top: 16.0,bottom: 16.0),
                // tileColor: Colors.black12,
                // onTap: () {
                //   Navigator.pop(context);
                // },
              ),
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                subtitle: Text("______________________________________________",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),),
                // tileColor: Colors.black12,
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
              ListTile(
                title: Text(
                  'League Fixtures',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                subtitle: Text("______________________________________________",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),),
                tileColor: Colors.black54,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text(
                  'Table Standings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                subtitle: Text("______________________________________________",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),),
                // tileColor: Colors.black12,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => StandingsIntro()));
                },
              ),

            ],
          ),
        ),
        appBar: AppBar(

          iconTheme: const IconThemeData(
            size: 30,
            color: Colors.white,
          ),
          centerTitle: true,
          title: const Text(
            "Live Football Scores",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body:

            Center(
              child: CarouselSlider.builder(
                itemCount: 9,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  List<String> names = ["Premier League", "Saudi Pro League", "Bundes Liga", "Serie A", "La Liga", "Ligue 1", "Current Live Matches", "Major League Soccer", "UCL"];
                  List<String> imgPaths = ["assets/pl.png", "assets/SPL.png", "assets/bundesliga.png", "assets/seriea.png", "assets/laliga.png", "assets/ligue1.png", "assets/clm.png", "assets/mls.png", "assets/ucl.png"];
                  List<Color> colours = [Colors.deepPurple.shade200, Colors.lime.shade400, Colors.teal.shade300, Colors.indigo.shade200, Colors.lightBlue.shade200, Colors.blueGrey.shade400, Colors.deepOrange.shade300, Colors.red.shade300, Colors.green.shade100];
                  List<String> countries = ["England", "Saudi Arabia", "Germany", "Italy", "Spain", "France", "Worldwide", "USA", "Europe"];
                  List<String> flags = ["assets/england.png", "assets/saudi.png", "assets/germany.png", "assets/italy.png", "assets/spain.png", "assets/france.png", "assets/world.png", "assets/usa.png", "assets/euro.png"];
                  return _buildCarouselItem(
                    context,
                    names[index],
                    imgPaths[index],
                    colours[index],
                    index + 1,
                    countries[index],
                    flags[index],
                  );
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  // autoPlay: true,
                  aspectRatio: 8.0 / 10,

                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ),


      ),
    );
  }
}
















//////////////////////////---------------///////////////
Widget _buildCarouselItem(BuildContext context, String text, String imagePath, Color color, int pageNumber, String countries,String flags){
  return InkWell(
      onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => getHomePage(pageNumber)),
    );
  },
    child: Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: Image.asset(
              imagePath,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
                  child: Text(countries,
                  style: TextStyle(
                    fontSize: 20
                  ),
                  )),
              SizedBox(width: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Image.asset(
                  flags,
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget getHomePage(int pageNumber) {
  switch (pageNumber) {
    case 1:
      return HomePagePL();
    case 2:
      return HomePageSPL();
    case 3:
      return HomePageBndLiga();
    case 4:
      return HomePageSerieA();
    case 5:
      return HomePageLaliga();
    case 6:
      return HomePageLigue1();
    case 7:
      return HomePage();
    case 8:
      return HomePageMLS();
    case 9:
      return HomePageUCL();
    default:
      return HomePage();
  }
}