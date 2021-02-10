import 'package:flutter/material.dart';

class Adddata extends StatefulWidget {
  @override
  _AdddataState createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
  Widget nameForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Name',
          icon: Icon(Icons.park),
        ),
      ),
    );
  }

  Widget detail() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'ชื่อวิทยาศาสตร์ : ',
          icon: Icon(Icons.drive_file_rename_outline),
        ),
      ),
    );
  }

  Widget detail2() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'ชื่อท้องถิ่น : ',
          icon: Icon(Icons.local_airport),
        ),
      ),
    );
  }

  Widget cameraButton() {
    return IconButton(
      icon: Icon(
        Icons.add_a_photo,
        size: 40.0,
        color: Colors.green,
      ),
      onPressed: () {},
    );
  }

  Widget galleryButton() {
    return IconButton(
      icon: Icon(
        Icons.add_photo_alternate,
        size: 40.0,
        color: Colors.yellow[700],
      ),
      onPressed: () {},
    );
  }

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[cameraButton(), galleryButton()],
    );
  }

  Widget showImage() {
    return Container(
      //color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.asset('assets/images/imageadd.png'),
    );
  }

  Widget showContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          showImage(),
          showButton(),
          nameForm(),
          detail(),
          detail2(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.limeAccent,
      ),
      body: Stack(
        children: <Widget>[
          showContent(),
          // CustomPaint(
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height,
          //   ),
          //   painter: HeaderCurvedContainer(),
          // ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.limeAccent;
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
