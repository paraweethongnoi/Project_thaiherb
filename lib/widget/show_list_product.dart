import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tess/widget/show_detail_product.dart';
//import 'package:tess/models/Product_model.dart';

class ShowListProduct extends StatefulWidget {
  @override
  _ShowListProductState createState() => _ShowListProductState();
}

class _ShowListProductState extends State<ShowListProduct> {
  DocumentSnapshot productModels;
  List products = [];
  List productSearch = [];
  final keyword = TextEditingController();

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    // ignore: deprecated_member_use
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final collectionReference = await firestore
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
  }

  Widget showImage(int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.width * 0.2,
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
    return Row(
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
    );
  }

  Widget showDetail(int index) {
    return Row(
      children: [
        Text(
          ':',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[700],
            fontFamily: 'Kanit',
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          products[index]["Detail"],
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey[800],
            fontFamily: 'Kanit',
          ),
        ),
      ],
    );
  }

  Widget showDetail2(int index) {
    return Row(
      children: [
        Text(
          ':',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[700],
            fontFamily: 'Kanit',
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          products[index]["Detail2"],
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey[800],
            fontFamily: 'Kanit',
          ),
        ),
      ],
    );
  }

  Widget showText(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 90.0,
      child: Column(
        children: <Widget>[
          showName(index),
          showDetail(index),
          showDetail2(index)
        ],
      ),
    );
  }

  Widget showListView(int index) {
    return InkWell(
      child: Row(
        children: <Widget>[
          showImage(index),
          showText(index),
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

  Widget showSearchView(){
    return ListView.separated(
                itemCount: productSearch.length,
                separatorBuilder: (context, index)=> Divider(),
                itemBuilder: (BuildContext buildcontext, int index) {
                  return ListTile(
                      title: Text(productSearch[index]["Name"]),
                      onTap: (){
                          MaterialPageRoute route = MaterialPageRoute(
                          builder: (BuildContext context) =>
                          ShowdetailProduct(productSearch[index]));
                          Navigator.push(context, route);
                      },
                  );
                },
              );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.limeAccent[700],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 20),
          child: TextFormField(
            controller: keyword,
            onChanged: (value){
                setState(() {
                  productSearch = products.where((element) => (element["Name"].contains(keyword.text))).toList();
                });
            },
            decoration: InputDecoration(labelText: 'กดเพื่อค้นหา',
              suffixIcon: Icon(Icons.search)
            ),
          ),
        ),
      ),
      body: keyword.text != "" ? showSearchView() : Stack(
        children: [
          CustomPaint(
            child: Container(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext buildcontext, int index) {
                  return showListView(index);
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
    Paint paint = Paint()..color = Colors.limeAccent[700];
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
