import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tess/screens/bmi1.dart';

import 'package:tess/screens/splashscreen.dart';
//import 'package:tess/screens/components/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyAppTien());
}

class MyAppTien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => SplashScreen(),
        '/home': (BuildContext context) => Bmi1(),
      },
    );
  }
}
