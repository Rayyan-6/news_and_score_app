import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../adsPage.dart';

class StatsPage extends StatefulWidget {
  final int fixtureId;

  StatsPage({required this.fixtureId});

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final String apiUrl = 'https://v3.football.api-sports.io/fixtures/statistics';
  late Future<Map<String, dynamic>> _statsData;
  Map<String, String> headers = {
    'x-rapidapi-host': 'v3.football.api-sports.io',
    'x-rapidapi-key': '87407270ef8ad8cea1271ad368709e39', // Replace with your actual RapidAPI key
  };

  @override
  void initState() {
    super.initState();
    _statsData = fetchData();
    _createInterstellerAd();
    _createBanner();
    _showInterstellerAd();
  }

  Future<Map<String, dynamic>> fetchData() async {
    Uri uri = Uri.parse('$apiUrl?fixture=${widget.fixtureId}');
    http.Response response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }

  }
  /////ads

  BannerAd? _bannerAd;


  void _createBanner() {
    _bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdMobService.bannerAdUnitId!,
        listener: AdMobService.bannerAdListener,
        request: const AdRequest())
      ..load();
  }
  InterstitialAd? _interstitialAd;

  ////ads
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
        appBar:AppBar(

          iconTheme: const IconThemeData(
            size: 30,
            color: Colors.white,
          ),
          centerTitle: true,
          title:  const Text(
            "Match Statistics",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30
            ),
          ),

          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: FutureBuilder<Map<String, dynamic>>(
            future: _statsData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),);
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var stats = snapshot.data?['response']?[0];
                return FootballStatsCard(stats: stats);
              }
            },
          ),
        ),
        bottomNavigationBar: (_bannerAd == null)
            ? Container(
          color: Colors.white,
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


class FootballStatsCard extends StatelessWidget {
  final Map<String, dynamic>? stats;

  FootballStatsCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    if (stats == null) {
      return Text('No data available');
    }

    var team = stats!['team'];
    var teamLogo = team['logo'];
    var teamName = team['name'];
    var statistics = stats!['statistics'];

    return Card(
      color: Color.fromRGBO(0, 0, 0, 0.5),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.network(teamLogo,width: 120,height: 120,),
          ListTile(
            title: Text(
              '$teamName',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Divider(),
          Container(
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (var stat in statistics)
                    ListTile(
                      title: Text(
                        stat['type'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        stat['value'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



