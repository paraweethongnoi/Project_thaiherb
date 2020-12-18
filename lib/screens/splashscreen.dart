import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.yellow.shade100, Colors.green],
                radius: 2.0,
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 180,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
