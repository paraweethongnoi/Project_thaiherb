import 'package:flutter/material.dart';
import 'package:tess/screens/components/infor.dart';
//import 'package:tess/screens/components/information.dart';
import 'package:tess/screens/components/manu.dart';
import 'package:tess/screens/components/home_screen.dart';
import 'package:tess/screens/components/setting.dart';

class Bmi1 extends StatefulWidget {
  @override
  _Bmi1State createState() => _Bmi1State();
}

class _Bmi1State extends State<Bmi1> {
  int _currentIndex = 0;

  final tabs = [
    Center(
        child: Scaffold(
      body: HomeScreen(),
    )),
    Center(
        child: Scaffold(
      body: Manu(),
    )),
    Center(
        child: Scaffold(
      body: InforScreen(),
    )),
    Center(
        child: Scaffold(
      body: SettingScreen(),
    ))
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
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            backgroundColor: Colors.lightBlue[400],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            backgroundColor: Colors.pink.shade200,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            backgroundColor: Colors.yellow.shade800,
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
