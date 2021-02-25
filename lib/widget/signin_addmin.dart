import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tess/screens/components/manu.dart';

import 'delete_edit_product.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  //Explicit
  final textFill = GlobalKey<FormState>();
  String username, password, idLogin;
  TextEditingController userCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void route(Widget routeName) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => routeName,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Widget content() {
    return Center(
      child: Form(
        key: textFill,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            showAppName(),
            SizedBox(
              height: 10.0,
            ),
            emailText(),
            SizedBox(
              height: 10.0,
            ),
            passwordText(),
            SizedBox(
              height: 20.0,
            ),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget showAppName() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        showLogo(),
        showText(),
      ],
    );
  }

  Widget showLogo() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Image.asset('assets/images/logo1.png'),
    );
  }

  Widget showText() {
    return Text(
      'Thai herbs',
      style: TextStyle(
          fontSize: 30.0,
          color: Colors.lightGreen.shade900,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontFamily: 'Courgette'),
    );
  }

  Widget emailText() {
    return Container(
      width: 300.0,
      child: TextFormField(
        onChanged: (value) => username = value.trim(),
        controller: userCon,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.attach_email,
              size: 36.0, color: Colors.lightGreen.shade900),
          labelText: 'Email :',
          labelStyle: TextStyle(
              color: Colors.lightGreen.shade800, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 300.0,
      child: TextFormField(
        onChanged: (value) => password = value.trim(),
        controller: passwordCon,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.vpn_key,
              size: 36.0, color: Colors.lightGreen.shade900),
          labelText: 'Password :',
          labelStyle: TextStyle(
              color: Colors.lightGreen.shade800, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<Null> checkAuthen() async {
    await Firebase.initializeApp().then((value) {
      print('******************************');
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;

      firebaseAuth
          .signInWithEmailAndPassword(email: username, password: password)
          .then((response) {
        print('Authen Success');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => SettingScreen());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      }).catchError((response) {
        String title = response.code;
        String message = response.message;
        myAlert(title, message);
      });
    });
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[FlatButton(onPressed: () {}, child: Text('ok'))],
          );
        });
  }

  Widget loginButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)),
      color: Colors.deepOrange[900],
      child: Text(
        'เข้าสู่ระบบ',
        style:
            TextStyle(fontSize: 18.0, color: Colors.white, fontFamily: 'Kanit'),
      ),
      onPressed: () {
        textFill.currentState.save();
        checkAuthen();
        print('Login');
      },
    );
  }

  Widget showTitle(String title) {
    return ListTile(
      leading: Icon(
        Icons.add_alert,
        size: 48.0,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade800,
        title: Text(
          'ผู้ดูแลระบบ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kanit'
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
     
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.yellow.shade100, Colors.tealAccent.shade100],
              radius: 5.0,
            ),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              content(),
            ],
          ),
        ),
      ),
    );
  }
}
