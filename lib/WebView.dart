

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';


// class ArticleWebViewPage extends StatefulWidget {
//   final String url;
//
//   ArticleWebViewPage({required this.url});
//
//   @override
//   _ArticleWebViewPageState createState() => _ArticleWebViewPageState();
// }
//
// class _ArticleWebViewPageState extends State<ArticleWebViewPage> {
//
//   // static String get url => url; //stack overflow error on using this
//
//   WebViewController controller = WebViewController()
//   ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   // ..setBackgroundColor(const Color(0x00000000))
//   ..setNavigationDelegate(
//   NavigationDelegate(
//   onProgress: (int progress) {
//   // Update loading bar.
//   },
//   onPageStarted: (String url) {},
//   onPageFinished: (String url) {},
//   onWebResourceError: (WebResourceError error) {},
//   onNavigationRequest: (NavigationRequest request) {
//   if (request.url.startsWith('https://www.youtube.com/')) {
//   return NavigationDecision.prevent;
//   }
//   return NavigationDecision.navigate;
//   },
//   ),
//   )
//   ..loadRequest(Uri.parse(url));
//
//
//   // late final WebViewController controller;
//   // final webCont = WebViewController();
//     // ..setJavaScriptMode(JavaScriptMode.disabled)
//     // ..loadRequest(Uri.parse(widget.url));
//
//   // void initState(){
//   //   super.initState();
//   //   controller= WebViewController()..loadRequest(Uri.parse("g"));
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     String url = widget.url;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Article WebView'),
//       ),
//       body:  WebViewWidget(controller: controller),
//
//     );
//   }
// }






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



