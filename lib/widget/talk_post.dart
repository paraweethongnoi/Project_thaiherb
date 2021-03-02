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
        title: Text("สร้างบทสนทนา"),
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
            child: Text("โพสต์"),
            onPressed: () =>
                portController.uploadData(textbox: textbox, status: "Post"),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
