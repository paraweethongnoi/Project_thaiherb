import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:tess/widget/how_to_eat.dart';

// ignore: must_be_immutable
class ShowdetailProduct extends StatefulWidget {
  Map<String, dynamic> product;
  ShowdetailProduct(this.product);

  @override
  _ShowdetailProductState createState() => _ShowdetailProductState();
}

class _ShowdetailProductState extends State<ShowdetailProduct> {
  @override
  void initState() {
    super.initState();
    print(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.height,
        child: Column(
          children: [
            // Stack(
            //   children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                      color: Colors.yellow[900])
                ],
              ),
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                image: DecorationImage(
                  image: NetworkImage(widget.product["PathImage"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Positioned(
            //   top: 250,
            // child:
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              widget.product["Name"],
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "ชื่อวิทยาศาสตร์ : ",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            widget.product["Detail"],
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "ชื่อท้องถิ่น : ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.green[800],
                                  fontFamily: 'Kanit',
                                ),
                              ),
                              Text(
                                widget.product["Detail2"],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.green[800],
                                  fontFamily: 'Kanit',
                                ),
                              ),
                            ],
                          ),
                          //ชื่อวงศ์
                          Text(
                            "ชื่อวงศ์ : ",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.green[800],
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            widget.product["Familyname"],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.green[800],
                              fontFamily: 'Kanit',
                            ),
                          ),

                          //ชื่อพ้อง
                          Text(
                            "ชื่อพ้อง : ",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            widget.product["Synonyms"],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.green[800],
                              fontFamily: 'Kanit',
                            ),
                          ),

                          //ชื่ออังกฤษ
                          Text(
                            "ชื่ออังกฤษ : ",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            widget.product["Englishname"],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.green[800],
                              fontFamily: 'Kanit',
                            ),
                          ),

                          SizedBox(height: 10),
                          Text(
                            "ลักษณะทางพฤกษศาสตร์ : ",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            widget.product["look"],
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                              fontFamily: 'Kanit',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "ส่วนที่ใช้เป็นยาและสรรพคุณ : ",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            widget.product["Partused"],
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                              fontFamily: 'Kanit',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "สารสำคัญที่ออกฤทธิ์ : ",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            widget.product["Important"],
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey[600],
                              fontFamily: 'Kanit',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              width: 500,
              child: OpenContainer(
                closedElevation: 0,
                transitionType: ContainerTransitionType.fade,
                transitionDuration: const Duration(milliseconds: 1000),
                openBuilder: (context, _) {
                  return Howtoeat(widget.product);
                },
                closedBuilder: (context, VoidCallback openContainer) {
                  return GestureDetector(
                    child: GestureDetector(
                      onTap: openContainer,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFFE0FFFF),
                              const Color(0xFFafe853),
                            ],
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "วิธีการใช้/รับประทาน",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // )
            // ],
            // ),
          ],
        ),
      ),
    );
  }
}