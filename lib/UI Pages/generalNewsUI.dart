import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../WebView.dart';
import '../adsPage.dart';

class generalNewsUI extends StatefulWidget {
  final String title;
  final List<String> apiEndpoints;
  const generalNewsUI({super.key, required this.title, required this.apiEndpoints});

  @override
  State<generalNewsUI> createState() => _generalNewsUIState();
}

class _generalNewsUIState extends State<generalNewsUI> {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;


  // Initialize a list to store articles
  List<dynamic> articles = [];
  Future<List<dynamic>> fetchData() async {
    try {
      List<dynamic> allArticles = [];

      for (String apiUrl in widget.apiEndpoints) {
        final response = await http.get(Uri.parse(apiUrl));
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          allArticles.addAll(data['articles']);
        } else {
          throw Exception('Failed to load data from $apiUrl');
        }
      }
      allArticles.shuffle();
      return allArticles;
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    _createInterstellerAd();
    _createInterstellerAd();
    _createBanner();
    _showInterstellerAd();
  }

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



  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   _createInterstellerAd();
  //   _createBanner();
  //   _showInterstellerAd();
  // }

  void _createBanner() {
    _bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdMobService.bannerAdUnitId!,
        listener: AdMobService.bannerAdListener,
        request: const AdRequest())
      ..load();
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
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),
          ),
        ),

        body:
        ////////new future buolder
        FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
              return Center(
                child: Text('No articles available.'),
              );
            } else {
              List<dynamic> articles = snapshot.data as List;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  var article = articles[index];

                  String truncateText(String text, int maxLength) {
                    if (text.length <= maxLength) {
                      return text;
                    }
                    return '${text.substring(0, maxLength)}...';
                  }

                  String truncatedTitle = truncateText(article['title'], 65);

                  return Card(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    margin: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ArticleWebViewPage(url: article['url'])),
                          // MaterialPageRoute(builder: (context) => ArticleWebViewPage(url: 'https:www.youtube.com')),
                        );
                      },
                      child: Container(
                        height: 130,
                        width: double.infinity,
                        child: ListTile(
                          trailing: article['urlToImage'] != null && article['urlToImage'].isNotEmpty
                              ? Image.network(
                            article['urlToImage'],
                            width: 120.0,
                            height: 110.0,
                          )
                              : Image.asset(
                            'assets/pl.png',
                            width: 100.0,
                            height: 90.0,
                          ),
                          title: Text(
                            truncatedTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            article['author'] ?? 'Unknown Author',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
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
