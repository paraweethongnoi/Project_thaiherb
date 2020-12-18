import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tess/screens/components/ResultScreen.dart';

import 'bmimodel.dart';

class InforScreen extends StatefulWidget {
  @override
  _InforScreenState createState() => _InforScreenState();
}

class _InforScreenState extends State<InforScreen> {
  double _heightofUser = 100.0;
  double _weightofUser = 40.0;

  double _bmi = 0;
  BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink.shade200,
      ),
      backgroundColor: Colors.red.shade50,
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
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: 200,
                      child: SvgPicture.asset(
                        'assets/images/BMI1C.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'คำนวณค่า BMI',
                      style: TextStyle(
                          color: Colors.red[700],
                          fontFamily: 'Kanit',
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'เราเป็นห่วงสุขภาพ ของคุณ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Kanit',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'ส่วนสูง (cm)',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Kanit',
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Slider(
                        min: 80.0,
                        max: 250.0,
                        onChanged: (height) {
                          setState(() {
                            _heightofUser = height;
                          });
                        },
                        value: _heightofUser,
                        divisions: 100,
                        activeColor: Colors.pink[700],
                        label: '$_heightofUser',
                      ),
                    ),
                    Text(
                      '$_heightofUser cm',
                      style: TextStyle(
                          color: Colors.red[800],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'น้ำหนัก (km)',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Kanit',
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Slider(
                        min: 30.0,
                        max: 120.0,
                        onChanged: (weight) {
                          setState(() {
                            _weightofUser = weight;
                          });
                        },
                        value: _weightofUser,
                        divisions: 100,
                        activeColor: Colors.pink[700],
                        label: '$_weightofUser',
                      ),
                    ),
                    Text(
                      '$_weightofUser kg',
                      style: TextStyle(
                          color: Colors.red[800],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: FlatButton.icon(
                        onPressed: () {
                          setState(() {
                            _bmi = _weightofUser /
                                ((_heightofUser / 100) * (_heightofUser / 100));

                            if (_bmi >= 18.5 && _bmi <= 25) {
                              _bmiModel = BMIModel(
                                  bmi: _bmi,
                                  isNormal: true,
                                  comments: "น้ำหนักคุณ อยู่ในเกณฑ์ปกติ");
                            } else if (_bmi < 18.5) {
                              _bmiModel = BMIModel(
                                  bmi: _bmi,
                                  isNormal: false,
                                  comments: "อยู่ในเกณฑ์น้ำหนักน้อยหรือผอม");
                            } else if (_bmi > 25 && _bmi <= 30) {
                              _bmiModel = BMIModel(
                                  bmi: _bmi,
                                  isNormal: false,
                                  comments: "น้ำหนักคุณ เกินเกณฑ์มาตรฐาน");
                            } else {
                              _bmiModel = BMIModel(
                                  bmi: _bmi,
                                  isNormal: false,
                                  comments: "คุณเป็นโรคอ้วน");
                            }
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                      bmiModel: _bmiModel,
                                    )),
                          );
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        label: Text('คำนวณ'),
                        textColor: Colors.white,
                        color: Colors.pink[700],
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 16, right: 16),
                    )
                  ],
                )),
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
