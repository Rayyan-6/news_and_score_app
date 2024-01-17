import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sem_project_new/UI%20Pages/FootballIntro.dart';

import '../adsPage.dart';
import 'StandingsTable.dart';

class StandingsIntro extends StatefulWidget {
  const StandingsIntro({super.key});

  @override
  State<StandingsIntro> createState() => _StandingsIntroState();
}

class _StandingsIntroState extends State<StandingsIntro> {


  BannerAd? _bannerAd;
  @override
  void initState() {
    super.initState();
    _createBanner();
  }

  void _createBanner() {
    _bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdMobService.bannerAdUnitId!,
        listener: AdMobService.bannerAdListener,
        request: const AdRequest())
      ..load();
  }
  InterstitialAd? _interstitialAd;
  void _createInterstellerAd() {
    InterstitialAd.load(
        adUnitId: AdMobService.interstitialAdUnitId!,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  void _showInterstellerAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createInterstellerAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createInterstellerAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd == null;
    }
  }

  final List<String> items = [
    "Premier League",
    "Saudi Pro League",
    "Bundes Liga",
    "Serie A",
    "La Liga",
    "Ligue 1",
    "Major League Soccer"
  ];



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/FBfield.jpg"),
          fit: BoxFit.cover,
        )
        ,),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            size: 30,
            color: Colors.white,
          ),
          centerTitle: true,
          title: const Text(
            "Standings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
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
                contentPadding: EdgeInsets.only(
                    left: 90.0, top: 16.0, bottom: 16.0),
              ),
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                subtitle: Text(
                  "______________________________________________",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                onTap: () {
                  _showInterstellerAd();
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
                subtitle: Text(
                  "______________________________________________",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                onTap: () {
                  _showInterstellerAd();
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FootballIntro()),
                  );
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
                subtitle: Text(
                  "______________________________________________",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                tileColor: Colors.black54,
                onTap: () {
                  _showInterstellerAd();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body:  ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => getStandingTable(index + 1)),
                  );
                },
                child: Card(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  child: ListTile(
                    title: Text(
                      items[index],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              );
            },
          ),


        ///////////////ads
        bottomNavigationBar: (_bannerAd == null)
            ? Container(
          color: Colors.red,
          height: 60,
          width: 470,)
            : SizedBox(
          height: 60,
          width: 470,
          child: AdWidget(ad: _bannerAd!),
        ),

      ),
    );
  }


}










//----------------/////////////
Widget getStandingTable(int index){

  switch (index){
    case 1:
      return StandingsTable(leagueId: 39);
    case 2:
      return StandingsTable(leagueId: 307);
    case 3:
      return StandingsTable(leagueId: 78);
    case 4:
      return StandingsTable(leagueId: 135);
    case 5:
      return StandingsTable(leagueId: 140);
    case 6:
      return StandingsTable(leagueId: 61);
    case 7:
      return StandingsTable(leagueId: 253);
    default:
      return StandingsTable(leagueId: 39);
  }

  }
