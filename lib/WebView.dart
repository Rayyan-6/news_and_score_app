

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';



class ArticleWebViewPage extends StatefulWidget {
  final String url;

  ArticleWebViewPage({required this.url});

  @override
  _ArticleWebViewPageState createState() => _ArticleWebViewPageState();
}

class _ArticleWebViewPageState extends State<ArticleWebViewPage> {

  @override
  Widget build(BuildContext context) {
    // Access the url from the widget's properties
    String url = widget.url;

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // ... other controller configurations
      ..loadRequest(Uri.parse(url));

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
            size: 30,
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Article Webview',
            style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),
          ),
        ),
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}



