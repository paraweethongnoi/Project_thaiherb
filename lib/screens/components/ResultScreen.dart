import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;
  ResultScreen({this.bmiModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink.shade200,
      ),
      body: Stack(
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Container(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.only(bottom: 20),
              //**** */
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: 200,
                      child: bmiModel.isNormal
                          ? SvgPicture.asset(
                              'assets/images/happyheart.svg',
                              fit: BoxFit.contain,
                            )
                          : SvgPicture.asset(
                              'assets/images/sadheart.svg',
                              fit: BoxFit.contain,
                            ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'ค่า BMI ของคุณ คือ ${bmiModel.bmi}',
                      style: TextStyle(
                          color: Colors.red[700],
                          fontFamily: 'Kanit',
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${bmiModel.comments}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Kanit',
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    bmiModel.isNormal
                        ? Text(
                            'ค่า BMI ของคุณ ปกติ!',
                            style: TextStyle(
                                color: Colors.red[700],
                                fontFamily: 'Kanit',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'ค่า BMI ของคุณ ไม่ปกติ!',
                            style: TextStyle(
                                color: Colors.red[700],
                                fontFamily: 'Kanit',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: FlatButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        label: Text('คำนวณใหม่อีกครั้ง'),
                        textColor: Colors.white,
                        color: Colors.pink[700],
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 16, right: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.pink.shade200;
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
