import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tess/widget/home_illness.dart';
import 'package:tess/widget/show_by_style.dart';
import 'package:tess/widget/show_list_product.dart';

class Manu extends StatefulWidget {
  @override
  _ManuState createState() => _ManuState();
}

class _ManuState extends State<Manu> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var cardTextStyle = TextStyle(
        fontFamily: 'ConcertOne', fontSize: 16, color: Colors.blue.shade600);

    return Container(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            title: Text('Search manu'),
            backgroundColor: Colors.lightBlue[400]),
        backgroundColor: Colors.lightBlue[50],
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
                              Text('Thai Herbs',
                                  style: TextStyle(
                                      fontSize: 70.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Courgette'))
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 60,
                        crossAxisSpacing: 5,
                        crossAxisCount: 2,
                        primary: false,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ShowListProduct());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/spice.svg',
                                  height: 120,
                                ),
                                Text(
                                  'ค้นหาด้วยชื่อ',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Search by name',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Homeillness());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/patient.svg',
                                  height: 120,
                                ),
                                Text(
                                  'ค้นหาตามอาการ',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Search by illness',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Manustyle());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/herb.svg',
                                  height: 120,
                                ),
                                Text(
                                  'ค้นหาตามลักษณะ',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Search by style',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ShowListProduct());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/cigarettes.svg',
                                  height: 120,
                                ),
                                Text(
                                  'สมุนไพรช่วยเลิกบุหรี่',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Help quit smoking',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ShowListProduct());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/map.svg',
                                  height: 120,
                                ),
                                Text(
                                  'แหล่งซื้อขาย',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Trading source',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ShowListProduct());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/add-file.svg',
                                  height: 120,
                                ),
                                Text(
                                  'เพิ่ม/แก้ไข',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Add / edit',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ShowListProduct());
                              Navigator.of(context).push(materialPageRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/chat.svg',
                                  height: 120,
                                ),
                                Text(
                                  'พูดคุย แลกเปลี่ยนความรู้',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'talk',
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
    Paint paint = Paint()..color = Colors.lightBlue[400];
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
