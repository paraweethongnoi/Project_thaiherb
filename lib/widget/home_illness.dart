import 'package:flutter/material.dart';
import 'package:tess/widget/show_list_illness1.dart';

import 'package:tess/widget/show_list_illness2.dart';

class Homeillness extends StatefulWidget {
  @override
  _HomeillnessState createState() => _HomeillnessState();
}

class _HomeillnessState extends State<Homeillness> {
  int _currentIndex = 0;

  final tabs = [
    Center(
        child: Scaffold(
      body: ShowListillness(),
    )),
    Center(
        child: Scaffold(
      body: ShowListillness2(),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('โรคหรืออาการภายใน'),
            backgroundColor: Colors.greenAccent[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('โรคหรืออาการภายนอก'),
            backgroundColor: Colors.lightBlue[400],
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
