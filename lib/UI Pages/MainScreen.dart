import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:admob_flutter/admob_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


import '../adsPage.dart';
import 'AmericanNewsUI.dart';
import 'CricketNewsUI.dart';
import 'FootballIntro.dart';
import 'FootballNewsApiManager.dart';

class MainScreen_3 extends StatefulWidget {
  const MainScreen_3({super.key});
  @override
  State<MainScreen_3> createState() => _MainScreen_3State();
}




class _MainScreen_3State extends State<MainScreen_3> {
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


  BannerAd? _bannerAd;
  @override
  void initState() {
    super.initState();

    _createInterstellerAd();
    _createBanner();
    _showInterstellerAd();
  }

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
      // color: Colors.white,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/FBfield.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(

          centerTitle: true,
          title: Text(
            "The Sports App",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove app bar shadow
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: CarouselSlider.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              List<String> imgPath = [
                "assets/fbnewsposter2.png",
                "assets/kohliposter.png",
                "assets/RonaldoPoster.png",
                "assets/ussportsposter.png"
              ];
              List<int> pageNumber = [1, 2, 3, 4];

              return _buildCarouselItem(
                context,
                imgPath[index],
                pageNumber[index],
              );
            },
            options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 8.0 / 8.78,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
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



/////////
Widget _buildCarouselItem(

    BuildContext context, String imagePath, int pageNumber) {
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
  return InkWell(
    onTap: () {
      _createInterstellerAd();
      _showInterstellerAd();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => getHomePage(pageNumber)),
      );
    },
    child: Positioned.fill(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget getHomePage(int pageNumber) {
  switch (pageNumber) {
    case 1:
      return FootballIntro();
    case 2:
      return CricketNewsUI();
    case 3:
      return NewsUI();
    case 4:
      return AmericanNewsUI();
    default:
      return FootballIntro();
  }
}
