import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tess/widget/show_detail_illness1.dart';

class ShowListillness extends StatefulWidget {
  @override
  _ShowListillnessState createState() => _ShowListillnessState();
}

class _ShowListillnessState extends State<ShowListillness> {
  DocumentSnapshot productModels;
  List posts = [];

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    // ignore: deprecated_member_use
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final collectionReference = await firestore
        .collection("posts")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                setState(() {
                  posts.add(doc.data());
                });
                print(posts.toList());
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purpleAccent[100],
        
      ),
      body: Stack(
        children: [
          CustomPaint(
            child: Container(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext buildcontext, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.purple[50],
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Image.network(
                              posts[index]["Image"],
                              width: 75,
                              height: 75,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              posts[index]["Name"],
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        MaterialPageRoute route = MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Showdetailillness1(posts[index]["Name"]));
                        Navigator.push(context, route);
                      },
                    ),
                  );
                },
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.purpleAccent[100];
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
