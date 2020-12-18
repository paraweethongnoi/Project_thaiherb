import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tess/screens/bmi1.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  String emailString, passString, nameString;

  Widget showLogo() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Image.asset('assets/images/logo.png'),
    );
  }

  Widget showText() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Text(
          'Thai herbs',
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.lightGreen.shade900,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontFamily: 'Courgette'),
        ),
      ),
    );
  }

  Widget signUpButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: 350.0,
      height: 50.0,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        elevation: 16,
        color: Color(0xff228B22),
        child: Text('REGISTER',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        onPressed: () {
          //register();
          print('You Click Upload');
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print('email = $emailString,pass = $passString');
            registerThread();
          }
        },
      ),
    );
  }

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passString)
        .then((response) {
      print('Register Success for Email = $emailString');
      setupDisplayName();
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title,message = $message');
      myAlert(title, message);
    });
  }

  Future<void> setupDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    var user = firebaseAuth.currentUser;
    if (user != null) {
      user.updateProfile(displayName: nameString);

      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Bmi1());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.add_alert,
                color: Colors.red,
              ),
              title: Text(
                title,
                style: TextStyle(color: Colors.red),
              ),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget displayName() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        style: TextStyle(color: Colors.green.shade900),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey[400],
                    style: BorderStyle.solid)),
            icon: Icon(
              Icons.person_pin,
              color: Colors.amber.shade900,
              size: 35.0,
            ),
            labelText: 'Name :',
            labelStyle: TextStyle(
              color: Colors.amber.shade900,
              fontWeight: FontWeight.bold,
            ),
            helperText: 'Please enter you name',
            helperStyle: TextStyle(
              color: Colors.amber.shade900,
              fontStyle: FontStyle.italic,
            )),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Your Name in The Blank ';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          nameString = value.trim();
        },
      ),
    );
  }

  Widget emailtext() {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        style: TextStyle(color: Colors.green.shade900),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey[400],
                    style: BorderStyle.solid)),
            icon: Icon(
              Icons.attach_email,
              color: Colors.green.shade800,
              size: 35.0,
            ),
            labelText: 'E-MAIL :',
            labelStyle: TextStyle(
              color: Colors.green.shade800,
              fontWeight: FontWeight.bold,
            ),
            helperText: 'Please enter you E-Mail',
            helperStyle: TextStyle(
              color: Colors.green.shade800,
              fontStyle: FontStyle.italic,
            )),
        validator: (String value) {
          if (!((value.contains('@')) && (value.contains('.')))) {
            return 'Please Type Email Format ';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          emailString = value.trim();
        },
      ),
    );
  }

  Widget passtext() {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        style: TextStyle(color: Colors.green.shade900),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey[400],
                    style: BorderStyle.solid)),
            icon: Icon(
              Icons.vpn_key,
              color: Colors.tealAccent.shade400,
              size: 35.0,
            ),
            labelText: 'Password :',
            labelStyle: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
            helperText: 'Please set a password',
            helperStyle: TextStyle(
              color: Colors.teal,
              fontStyle: FontStyle.italic,
            )),
        validator: (String value) {
          if (value.length < 6) {
            return 'Password More 6 Charactor';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          passString = value.trim();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen.shade800,
          title: Text('Register'),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: ListView(
              padding: EdgeInsets.all(35.0),
              children: <Widget>[
                showLogo(),
                showText(),
                displayName(),
                emailtext(),
                passtext(),
                signUpButton()
              ],
            ),
          ),
        ));
  }
}
