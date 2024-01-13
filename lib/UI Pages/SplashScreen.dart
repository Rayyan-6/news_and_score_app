import 'dart:async';

import 'package:flutter/material.dart';

import 'MainScreen.dart';
import 'MainScreen_3.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 7),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen_3()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "assets/FBfield.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to The Sports App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Image.asset("assets/splashgif.gif"),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


////////////Code with ads///////////////

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   InterstitialAd? _interstitialAd;
//   bool _isAdLoaded = false;
//
//   @override
//   void initState() {
//     super.initState();
//     loadInterstitialAd();
//
//     // Delayed navigation to the main screen after 5 seconds
//     Timer(
//       Duration(seconds: 7),
//           () {
//         if (_isAdLoaded) {
//           _interstitialAd?.show();
//         }
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => MainScreen_3()),
//         );
//       },
//     );
//   }
//
//   Future<void> loadInterstitialAd() async {
//     InterstitialAd.load(
//       adUnitId: 'your_interstitial_ad_unit_id',
//       request: AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) {
//           setState(() {
//             _interstitialAd = ad;
//             _isAdLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (error) {
//           print('Interstitial Ad failed to load: $error');
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _interstitialAd?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image
//           Image.asset(
//             "assets/FBfield.jpg",
//             width: double.infinity,
//             height: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "Welcome to The Sports App",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 25,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//                 Image.asset("assets/splashgif.gif"),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

