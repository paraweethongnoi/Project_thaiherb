import 'package:flutter/material.dart';
import 'package:tess/widget/show_list_product.dart';
import 'package:tess/widget/show_list_shrub.dart';
import 'package:tess/widget/show_list_stylestanding.dart';

class Manustyle extends StatefulWidget {
  @override
  _ManustyleState createState() => _ManustyleState();
}

class _ManustyleState extends State<Manustyle> {
  List products = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var cardTextStyle = TextStyle(
        fontFamily: 'ConcertOne', fontSize: 18, color: Colors.lightGreen[900]);

    return Container(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            title: Text(
              'ค้นหาตามลักษณะ',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue[50],
                fontFamily: 'Kanit',
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.lightGreen[900]),
        backgroundColor: Colors.lightGreen[50],
        body: Stack(
          children: [
            CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              painter: HeaderCurvedContainer(),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 40,
                        crossAxisSpacing: 30,
                        crossAxisCount: 1,
                        primary: false,
                        children: <Widget>[
                          RaisedButton(
                             color: Colors.lime[100],
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Showliststylestanding("ไม้ต้น"));
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/Shrub.png',
                                  height: 250,
                                ),
                                Text(
                                  'ไม้ต้น',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Standing timber',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.lime[100],
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Showlistshrub("ไม้พุ่ม"));
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/pngegg (1).png',
                                  height: 250,
                                ),
                                Text(
                                  'ไม้พุ่ม',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Shrub',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.lime[100],
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ShowListProduct());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/herbaceousplant.png',
                                  height: 250,
                                ),
                                Text(
                                  'ไม้ล้มลุก',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Herbaceous plant',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.lime[100],
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ShowListProduct());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/Vine.png',
                                  height: 250,
                                ),
                                Text(
                                  'ไม้เถา',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Vine',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.lightGreen[900];
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
