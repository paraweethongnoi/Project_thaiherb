import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tess/widget/edit_list_product.dart';

class ShowEditDelPd extends StatefulWidget {
  ShowEditDelPd({Key key}) : super(key: key);

  @override
  _ShowEditDelPdState createState() => _ShowEditDelPdState();
}

class _ShowEditDelPdState extends State<ShowEditDelPd> {
  DocumentSnapshot productModels;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List products = [];

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    // ignore: deprecated_member_use
    final collectionReference = await firestore
        .collection("Product")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> map = Map();
                map = doc.data();
                map["docid"] = doc.id;
                setState(() {
                  products.add(map);
                });
                print(products.toList());
              })
            });
  }

  void myAlert(String docid) {
    showDialog(
        context: context,
        builder: (BuildContext constext) {
          return AlertDialog(
            title: Text('Are You Sure ?'),
            content: Text('Do You Want Delete Product ?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  deledata(docid).then((value) => Navigator.of(context).pop());
                },
              ),
            ],
          );
        });
  }

  Future<bool> deledata(String docid) async {
    await firestore.collection("Product").doc(docid).delete();
    products = [];
    readAllData();
    return true;
  }

  Widget showdata() {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            child: SizedBox(
              height: 65,
              child: Card(
                child: ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        MaterialPageRoute route = MaterialPageRoute(
                            builder: (BuildContext _context) =>
                                EditListProduct(products[index]));
                        Navigator.of(context).push(route).then((value) {
                          setState(() {
                            products = [];
                            readAllData();
                          });
                        });
                      },
                    ),
                    title: Text(products[index]["Name"]),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        myAlert(products[index]["docid"]);
                      },
                    )),
                color: Colors.white,
              ),
            ),
          );

          //Container(
          //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          //   child: ListTile(
          //     leading: IconButton(
          //       icon: Icon(Icons.edit),
          //       onPressed: () {},
          //     ),
          //     title: Text(products[index]["Name"]),
          //     trailing: IconButton(
          //       icon: Icon(Icons.delete),
          //       onPressed: () {},
          //     ),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.horizontal(right: Radius.circular(5.0))),
          //     tileColor: Colors.white,
          //   ),
          // );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepOrange[300],
        title: Text(
          'แก้ไข / ลบ',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: showdata(),
    );
  }
}
