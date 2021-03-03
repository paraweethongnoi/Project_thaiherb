import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tess/controller/port_controller.dart';

class TalkPost extends StatefulWidget {
  TalkPost({Key key}) : super(key: key);

  @override
  _TalkPostState createState() => _TalkPostState();
}

class _TalkPostState extends State<TalkPost> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final textbox = TextEditingController();
  PortController portController;
  final maxLines = 90;
  //formdatetime(y,m,d,h,m)//

  @override
  void initState() {
    super.initState();
    portController = PortController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.indigo[400],
        title: Text(
          "สร้างบทสนทนา",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        height: maxLines * 24.0,
        child: TextField(
          controller: textbox,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: "เขียนข้อความ",
            filled: true,
          ),
        ),
      ),
      floatingActionButton: SizedBox(
          width: double.infinity,
          child: RaisedButton(
             color: Colors.blue,
            child: Text(
              "โพสต์",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () =>
                portController.uploadData(textbox: textbox, status: "Post"),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
