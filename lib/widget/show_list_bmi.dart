import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tess/widget/show_detail_product.dart';

class Showlistbmi extends StatefulWidget {
  final String showbmi;

  Showlistbmi(this.showbmi);

  @override
  _ShowlistbmiState createState() => _ShowlistbmiState();
}

class _ShowlistbmiState extends State<Showlistbmi> {
  List products = [];

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    // ignore: deprecated_member_use
    var collectionReference;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    if (widget.showbmi == null) {
      collectionReference = await firestore
          .collection("Product")
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  setState(() {
                    products.add(doc.data());
                  });
                  print(products.toList());
                })
              });
    } else {
      collectionReference = await firestore
          .collection("Product")
          .where("bmi", isEqualTo: widget.showbmi)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          setState(() {
            products.add(doc.data());
          });
          print(products.toList());
        });
      });
    }
  }

  Widget showImage(int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.27,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: NetworkImage(products[index]["PathImage"]),
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget showName(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFFfbfcd4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            products[index]["Name"],
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget showDetail(int index) {
    return Text(
      ':'+products[index]["Detail"],overflow: TextOverflow.ellipsis,
      style: TextStyle(
       // fontSize: 15.0,
        color: Colors.grey[800],
        fontFamily: 'Kanit',
      ),
    );
  }

  Widget showall(int index) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          showImage(index),
          showName(index),
          showDetail(index),
        ],
      ),
      onTap: () {
        MaterialPageRoute route = MaterialPageRoute(
            builder: (BuildContext context) =>
                ShowdetailProduct(products[index]));
        Navigator.push(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.brown[50],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown[200],
        title: Text(
          'รายการสมุนไพร',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
      
        child: Stack(
          children: [
            CustomPaint(
              child: GridView.builder(
                
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext buildcontext, int index) {
                  return showall(index);
                },
                itemCount: products.length,
              ),
              painter: HeaderCurvedContainer(),
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
    Paint paint = Paint()..color = Colors.brown[200];
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
