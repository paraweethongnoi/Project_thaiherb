import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tess/screens/signin.dart';

import '../widget/delete_edit_product.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Method

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final user = await _firebaseAuth.currentUser;

    if (user != null) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => SettingScreen());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  Widget showLogo() {
    return Container(
      width: 190.0,
      height: 190.0,
      child: Image.asset('assets/images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Thai herbs',
      style: TextStyle(
          fontSize: 45.0,
          color: Colors.green.shade700,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontFamily: 'Courgette'),
    );
  }

////////////////////////////////////////////////////////////////////////////
  Widget signInButton() {
    return Container(
      width: 350.0,
      height: 50.0,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.green.shade700,
        child: Text(
          'LOGIN',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          print('Tou Click Sign In');

          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => Signin());
          Navigator.of(context).push(materialPageRoute);
        },
      ),
    );
  }

  // Widget signUpButton() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 20),
  //     width: 350.0,
  //     height: 50.0,
  //     child: RaisedButton(
  //       shape: new RoundedRectangleBorder(
  //           borderRadius: new BorderRadius.circular(30.0)),
  //       color: Colors.white,
  //       child: Text('REGISTER',
  //           style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //           )),
  //       onPressed: () {
  //         print('Tou Click Sign Up');

  //         MaterialPageRoute materialPageRoute =
  //             MaterialPageRoute(builder: (BuildContext context) => Register());
  //         Navigator.of(context).push(materialPageRoute);
  //       },
  //     ),
  //   );
  // }

  Widget showButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signInButton(),
        SizedBox(
          width: 50.0,
        ),
        //signUpButton(),
      ],
    );
  }

//////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.yellow.shade100, Colors.green],
            radius: 2.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              showAppName(),
              SizedBox(
                height: 40.0,
              ),
              showButton(),
            ],
          ),
        ),
      ),
    ));
  }
}
