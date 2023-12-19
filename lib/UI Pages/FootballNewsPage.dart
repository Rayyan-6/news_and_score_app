import 'package:flutter/material.dart';

import 'NewsContainer.dart';

class FootballNewsPage extends StatefulWidget {
  const FootballNewsPage({super.key});

  @override
  State<FootballNewsPage> createState() => _FootballNewsPageState();
}

class _FootballNewsPageState extends State<FootballNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime[300],
        surfaceTintColor: Colors.black,
        centerTitle: true,
        title: Text(" khabrain "),
      ),
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context,index){
            return NewsContainer();
          }
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.call),label: " ")
          ,BottomNavigationBarItem(icon: Icon(Icons.call), label: " ")
        ],
      ),

    );
  }
}
