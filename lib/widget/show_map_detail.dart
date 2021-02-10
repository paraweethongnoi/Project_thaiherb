import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Showmapdetail extends StatefulWidget {
  Map<String, dynamic> showlistmap;
  Showmapdetail(this.showlistmap);

  @override
  _ShowmapdetailState createState() => _ShowmapdetailState();
}

class _ShowmapdetailState extends State<Showmapdetail> {
  LatLng latLng;
  String nameShop;
  @override
  void initState() {
    super.initState();
    getData();
    print(widget.showlistmap);
  }

  Future<void> getData() async {
    //   ignore: deprecated_member_use
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final collectionReference = await firestore
        .collection("showmap")
        .doc(widget.showlistmap["Namemap"])
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        GeoPoint pos = data['shmap'];
        setState(() {
          nameShop = data['Namemap'];
          latLng = LatLng(pos.latitude, pos.longitude);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red[300],
        title: Text(
          widget.showlistmap["Namemap"],
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.bold,
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
        height: size.height,
        width: size.height,
        child: Column(
          children: [
            CustomPaint(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                          image: NetworkImage(widget.showlistmap["image1"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              painter: HeaderCurvedContainer(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "รายละเอียด : ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.red[900],
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.showlistmap["Detail"],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[700],
                          fontFamily: 'Kanit',
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "ราคาเบื้องต้น : ",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.red[900],
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            widget.showlistmap["price"],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[700],
                              fontFamily: 'Kanit',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "เงื่อนไข  : ",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.red[900],
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            widget.showlistmap["condition"],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[700],
                              fontFamily: 'Kanit',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "ข้อมูลติดต่อ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ที่อยู่ : ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.showlistmap["Address"],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[700],
                          fontFamily: 'Kanit',
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.local_phone,
                                  color: Colors.green[600],
                                  size: 50,
                                ),
                                onPressed: () async {
                                  var url = 'tel:${widget.showlistmap["Tel"]}';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Couid not launch $url';
                                  }
                                }),
                          ),
                          Text(
                            widget.showlistmap["Tel"],
                            style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red[900],
                          fontFamily: 'Kanit',
                        ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.web_asset,
                                color: Colors.yellow[900],
                                size: 50,
                              ),
                              onPressed: () async {
                                var url = '${widget.showlistmap["Website"]}';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Couid not launch $url';
                                }
                              },
                            ),
                          ),
                          Text(
                            'Click website',
                            style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red[900],
                          fontFamily: 'Kanit',
                        ),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: latLng == null
                                  ? CircularProgressIndicator()
                                  : showmap(latLng, nameShop),
                            ),
                          ],
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
    );
  }
}

Container showmap(LatLng latLng, String nameShop) {
  CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 16.0);
  return Container(
    height: 300,
    child: GoogleMap(
      markers: {
        Marker(
            markerId: MarkerId("1"),
            position: latLng,
            onTap: () {},
            infoWindow: InfoWindow(title: nameShop))
      },
      initialCameraPosition: cameraPosition,
      mapType: MapType.normal,
      onMapCreated: (controller) {},
    ),
  );
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red[300];
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
