import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'MainScreen.dart';
import 'package:http/http.dart' as http;


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  Future<bool> fetchReviewStatus() async{
    final response = await http.get(Uri.parse("https://project-backend-teal.vercel.app/myApi"));
    // final response = await http.get(Uri.parse("localhost:6900/myApi"));

    final Map<String,dynamic> data = json.decode(response.body) ;


   print(response.body);
    print(data.toString());


    return data['in_review'];


  }


  // @override
  // void initState() {
  //   super.initState();
  //   fetchReviewStatus().then((value) {
  //     if (value){
  //       Timer(
  //         Duration(seconds: 5),
  //             () => Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => MainScreen_3()),
  //         ),
  //       );
  //     }
  //   });
  //
  // }

  @override
  void initState() {
    super.initState();


        Timer(
          Duration(seconds: 5),
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


