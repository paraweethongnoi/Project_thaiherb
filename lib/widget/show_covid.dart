import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tess/widget/covid_today_result.dart';

class Covid19 extends StatefulWidget {
  @override
  _Covid19State createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> {
  CovidToday _dataFromWebAPI;

  @override
  void initState() {
    super.initState();

    print('init state');
    getData();
  }

  Future<void> getData() async {
    print('get data');
    var response = await http.get('https://covid19.th-stat.com/api/open/today');
    print(response.body);

    setState(() {
      _dataFromWebAPI = covidTodayFromJson(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink,
        title: Text(
          'รายงานสถานการณ์ โควิด-19',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'Kanit',
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFffffff),
              const Color(0xFFffe2e2),
            ],
          ),
        ),
        child: CustomPaint(
          painter: HeaderCurvedContainer(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Text(
                        'อัพเดทข้อมูลล่าสุด : ',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontFamily: 'Kanit',
                        ),
                      ),
                      title: Text(
                        '${_dataFromWebAPI?.updateDate ?? '...'}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.pink[300],
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            'ผู้ติดเชื้อสะสม',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            '${_dataFromWebAPI?.confirmed ?? '...'}',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            '+ ${_dataFromWebAPI?.newConfirmed ?? '...'}',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.green[900],
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            'หายแล้ว',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            '${_dataFromWebAPI?.recovered ?? '...'}',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            '+ ${_dataFromWebAPI?.newRecovered ?? '...'}',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.blueAccent,
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            'รักษาอยู่ใน รพ.',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            '${_dataFromWebAPI?.hospitalized ?? '...'}',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.grey,
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            'เสียชีวิต',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            '${_dataFromWebAPI?.deaths ?? '...'}',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.pink;
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
