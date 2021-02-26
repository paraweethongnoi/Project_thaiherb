import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tess/screens/bmi1.dart';
class DeleteEdite{
    final BuildContext _context;
    DeleteEdite(BuildContext context) : _context = context;

    
  Widget signOutButton() {
    return IconButton(
      icon: Icon(
        Icons.exit_to_app,
        size: 40,
      ),
      tooltip: 'Sign Out',
      onPressed: () {
        myAlert();
      },
    );
  }

  void myAlert() {
    showDialog(
        context: _context,
        builder: (BuildContext constext) {
          return AlertDialog(
            title: Text('Are You Sure ?'),
            content: Text('Do You Want Sign Out ?'),
            actions: <Widget>[
              cancelButton(),
              okButton(),
            ],
          );
        });
  }

  Widget okButton() {
    return FlatButton(
      child: Text('Ok'),
      onPressed: () {
        Navigator.of(_context).pop();
        procassSignOut();
      },
    );
  }

  Future<void> procassSignOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Bmi1());
      Navigator.of(_context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  Widget cancelButton() {
    return FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.of(_context).pop();
      },
    );
  }


    Widget deleteEdit(){
    return Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(_context).size.width,
              height: MediaQuery.of(_context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          signOutButton()
        ],
      );
  }

  

}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xfff9a825);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}




