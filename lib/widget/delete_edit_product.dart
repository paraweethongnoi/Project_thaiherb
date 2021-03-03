import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tess/screens/bmi1.dart';
import 'package:tess/widget/show_edit_del_pd.dart';


class DeleteEdite {
  final BuildContext _context;
  DeleteEdite(BuildContext context) : _context = context;

  Widget signOutButton(String status, IconData icon, String text) {
    return SizedBox(
      width: MediaQuery.of(_context).size.width * 0.9,
      height: 90,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        color: Colors.orange,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              Text(
                "$text",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontFamily: 'Kanit',
                ),
              )
            ],
          ),
        ),
        onPressed: status == "edit"
            ? () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (BuildContext _context) => ShowEditDelPd());
                Navigator.of(_context).push(route);
              }
            : () {
                myAlert();
              },
      ),
    );
  }

  void myAlert() {
    showDialog(
        context: _context,
        builder: (BuildContext constext) {
          return AlertDialog(
            title: Text('คุณแน่ใจใช่ไหม ?'),
            content: Text('คุณต้องการที่จะออกจากระบบ ?'),
            actions: <Widget>[
              cancelButton(),
              okButton(),
            ],
          );
        });
  }

  Widget okButton() {
    return FlatButton(
      child: Text('ใช่'),
      onPressed: () {
        Navigator.of(_context).pop();
        procassSignOut();
      },
    );
  }

  Widget showtext() {
    return Text(
      'สำหรับผู้ดูแลระบบ',
      style: TextStyle(
          fontSize: 20.0,
          color: Colors.green.shade700,
          fontWeight: FontWeight.bold,
          fontFamily: 'Kanit'),
    );
  }

  Widget showLogo() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Image.asset('assets/images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Thai herbs',
      style: TextStyle(
          fontSize: 30.0,
          color: Colors.green.shade700,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontFamily: 'Courgette'),
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
      child: Text('ยกเลิก'),
      onPressed: () {
        Navigator.of(_context).pop();
      },
    );
  }

  //main state detele_edite//
  Widget deleteEdit() {
    return Container(
    decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFffffff),
              const Color(0xFFFFE4B5),
            ],
          ),
        ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(_context).size.width,
              height: MediaQuery.of(_context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    
                    height: 120,
                    margin: EdgeInsets.only(bottom: 50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('สำหรับผู้ดูแลระบบ',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit',
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              showLogo(),
              showAppName(),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              signOutButton("edit", Icons.edit, "จัดการข้อมูลสมุนไพร"),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              signOutButton("logout", Icons.exit_to_app, "ออกจากระบบ")
            ],
          ),
        ],
      ),
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
