import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sem_project_new/UI%20Pages/FootballNewsApiManager.dart';

import '../WebView.dart';
import 'generalNewsUI.dart';

class CricketNewsUI extends StatefulWidget {
  @override
  _CricketNewsUIState createState() => _CricketNewsUIState();
}

// class _CricketNewsUIState extends State<CricketNewsUI> {
//
//
// // Assuming article['title'] is a String
//
//   final List<String> apiEndpoints = [
//     'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
//     // 'https://newsapi.org/v2/top-headlines?country=ca&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
//     // 'https://newsapi.org/v2/top-headlines?country=fr&category=sports&apiKey=API_KEY_3',
//   ];
//   // Initialize a list to store articles
//   List<dynamic> articles = [];
//   Future<List<dynamic>> fetchData() async {
//     try {
//       List<dynamic> allArticles = [];
//
//       for (String apiUrl in apiEndpoints) {
//         final response = await http.get(Uri.parse(apiUrl));
//         if (response.statusCode == 200) {
//           final Map<String, dynamic> data = json.decode(response.body);
//           allArticles.addAll(data['articles']);
//         } else {
//           throw Exception('Failed to load data from $apiUrl');
//         }
//       }
//       allArticles.shuffle();
//       return allArticles;
//     } catch (error) {
//       print('Error: $error');
//       return [];
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     // appBar: AppBar(
//   //     //   centerTitle: true,
//   //     //   backgroundColor: Colors.lime[800],
//   //     //   title: Text(
//   //     //     'News App',
//   //     //     style: TextStyle(color: Colors.white),
//   //     //   ),
//   //     // ),
//   //     body: Container(
//   //       decoration: BoxDecoration(
//   //         image: DecorationImage(
//   //           image: AssetImage("assets/FBfield.jpg"), // Change to the actual path of your background image
//   //           fit: BoxFit.cover,
//   //         ),
//   //       ),
//   //       child: Column(
//   //         children: [
//   //           // Add a Text widget here
//   //           Padding(
//   //             padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
//   //
//   //             child: Row(
//   //               mainAxisAlignment: MainAxisAlignment.start,
//   //               children: [
//   //                 Align(
//   //                   alignment: Alignment.centerLeft,
//   //                   child: Padding(
//   //                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//   //                     child: IconButton(
//   //                       icon: Icon(
//   //                         Icons.arrow_back,
//   //                         color: Colors.white, // Set the color to white
//   //                         size: 30.0,
//   //                       ),
//   //                       onPressed: () {
//   //                         // Navigate back when the arrow is pressed
//   //                         Navigator.pop(context);
//   //                       },
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 Padding(
//   //                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//   //                   child: Text(
//   //                     'Cricket News',
//   //                     style: TextStyle(
//   //                       color: Colors.white,
//   //                       fontSize: 25,
//   //                       fontWeight: FontWeight.bold,
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //
//   //           ),
//   //           // ListView.builder for displaying news articles
//   //           Expanded(
//   //             child: FutureBuilder(
//   //               future: fetchData(),
//   //               builder: (context, snapshot) {
//   //                 if (snapshot.connectionState == ConnectionState.waiting) {
//   //                   return Center(
//   //                     child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
//   //                   );
//   //                 } else if (snapshot.hasError) {
//   //                   return Center(
//   //                     child: Text('Error: ${snapshot.error}'),
//   //                   );
//   //                 } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
//   //                   return Center(
//   //                     child: Text('No articles available.'),
//   //                   );
//   //                 } else {
//   //                   List<dynamic> articles = snapshot.data as List;
//   //                   return ListView.builder(
//   //                     itemCount: articles.length,
//   //                     itemBuilder: (context, index) {
//   //                       var article = articles[index];
//   //
//   //                       String truncateText(String text, int maxLength) {
//   //                         if (text.length <= maxLength) {
//   //                           return text;
//   //                         }
//   //                         return '${text.substring(0, maxLength)}...';
//   //                       }
//   //
//   //                       String truncatedTitle = truncateText(article['title'], 70);
//   //
//   //                       return Card(
//   //
//   //                         color: Color.fromRGBO(0, 0, 0, 0.3),
//   //                         margin: EdgeInsets.all(8.0),
//   //                         child: Container(
//   //                           height: 130,
//   //                           width: double.infinity,
//   //                           child: ListTile(
//   //                             trailing: article['urlToImage'] != null && article['urlToImage'].isNotEmpty
//   //                                 ? Image.network(
//   //                               article['urlToImage'],
//   //                               width: 100.0,
//   //                               height: 90.0,
//   //                             )
//   //                                 : Image.asset(
//   //                               'assets/pl.png',
//   //                               width: 100.0,
//   //                               height: 90.0,
//   //                             ),
//   //                             title: Text(truncatedTitle,
//   //                                 style: TextStyle(
//   //                                   color: Colors.white,
//   //                                   fontWeight: FontWeight.bold
//   //
//   //                                 ),
//   //                             ),
//   //                             subtitle: Text(article['author'] ?? 'Unknown Author',
//   //                               style: TextStyle(
//   //                                   color: Colors.white
//   //
//   //                               ),
//   //                             ),
//   //                             onTap: () {
//   //                               // Handle tapping on the article
//   //                               // You can navigate to a new page or show more details here
//   //                             },
//   //                           ),
//   //                         ),
//   //                       );
//   //                     },
//   //                   );
//   //                 }
//   //               },
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //     /////
//   //   );
//   // }
//
// //////////////////////new UI.///////hui hui hui/////////////////////
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//         image: DecorationImage(
//         image: AssetImage("assets/FBfield.jpg"),
//     fit: BoxFit.cover,
//     )
//           ,),
//
//     child: Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.white,
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         title: Text(
//           'Cricket News',
//           style: TextStyle(color: Colors.white,
//           fontWeight: FontWeight.bold,
//             fontSize: 25
//           ),
//         ),
//       ),
//
//       body:
//       ////////new future buolder
//       FutureBuilder(
//         future: fetchData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
//             return Center(
//               child: Text('No articles available.'),
//             );
//           } else {
//             List<dynamic> articles = snapshot.data as List;
//             return ListView.builder(
//               itemCount: articles.length,
//               itemBuilder: (context, index) {
//                 var article = articles[index];
//
//                 String truncateText(String text, int maxLength) {
//                   if (text.length <= maxLength) {
//                     return text;
//                   }
//                   return '${text.substring(0, maxLength)}...';
//                 }
//
//                 String truncatedTitle = truncateText(article['title'], 65);
//
//                 return Card(
//                   color: Color.fromRGBO(0, 0, 0, 0.3),
//                   margin: EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => ArticleWebViewPage(url: article['url'])),
//                         // MaterialPageRoute(builder: (context) => ArticleWebViewPage(url: 'https:www.youtube.com')),
//                       );
//                     },
//                     child: Container(
//                       height: 130,
//                       width: double.infinity,
//                       child: ListTile(
//                         trailing: article['urlToImage'] != null && article['urlToImage'].isNotEmpty
//                             ? Image.network(
//                           article['urlToImage'],
//                           width: 120.0,
//                           height: 110.0,
//                         )
//                             : Image.asset(
//                           'assets/pl.png',
//                           width: 100.0,
//                           height: 90.0,
//                         ),
//                         title: Text(
//                           truncatedTitle,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: Text(
//                           article['author'] ?? 'Unknown Author',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//
//
//     ),
//       );
//     //container
//   }
//
//
// /////////////////////////last bracket///
// }

//////////////////////////////New UI/////////////


class _CricketNewsUIState extends State<CricketNewsUI> {
  final List<String> apiEndpoints = [
    'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
    // 'https://newsapi.org/v2/top-headlines?country=ca&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2',
    // 'https://newsapi.org/v2/top-headlines?country=fr&category=sports&apiKey=API_KEY_3',
  ];
  @override
  Widget build(BuildContext context) {
    return generalNewsUI(title: 'Cricket News', apiEndpoints: apiEndpoints,);
    //container
  }
}