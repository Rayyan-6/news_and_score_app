import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsUI extends StatefulWidget {
  @override
  _NewsUIState createState() => _NewsUIState();
}

class _NewsUIState extends State<NewsUI> {
  final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=561b45e555de46b3b70e4495f4ffc5a2';



  // Initialize a list to store articles
  List<dynamic> articles = [];

  Future<void> fetchData() async {
    try {

      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          articles = data['articles'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lime[800],
        title: Text('News App',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          var article = articles[index];
          return Card(
            color: Colors.lime[300],
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(article['title']),
              subtitle: Text(article['author'] ?? 'Unknown Author'),
              onTap: () {
                // Handle tapping on the article
                // You can navigate to a new page or show more details here
              },
            ),
          );
        },
      ),
    );
  }
}