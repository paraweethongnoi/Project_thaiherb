import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tess/controller/port_controller.dart';
import 'package:tess/widget/talk_post.dart';
import 'package:tess/widget/talk_post_docid.dart';

class Talk extends StatefulWidget {
  Talk({Key key}) : super(key: key);

  @override
  _TalkState createState() => _TalkState();
}

class _TalkState extends State<Talk> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List talks = [];
  PortController portController;

  Timer _timer;

  void startTimer() {
    const oneSec = const Duration(minutes: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {});
      },
    );
  }

  void dataread() async {
    talks = await portController.readAllData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    portController = PortController(context);
    dataread();
    // startTimer();
  }

  Widget showdata() {
    return ListView.builder(
        itemCount: talks.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            child: Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                  child: 
                            Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(portController
                                .dateTimeConvert(talks[index]["datetime"])),
                            Text(talks[index]["talkDetail"]),
                            Divider(),
                            Row(
                              children: [
                                IconButton(
                        icon: 
                                Icon(
                                  Icons.comment,
                                  color: Colors.red,
                                ),
                        onPressed: () {
                          MaterialPageRoute route = MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TalkPostDocId("${talks[index]["docid"]}"));
                          Navigator.push(context, route).then((value) {
                                setState(() {
                                  dataread();
                                });
                          });
                        },
                  ),
                  Text("${talks[index]["coments"].length}"),
                              ],
                            ),
                          ],
                      ),
                ),
              ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        title: Text(
          "บทสนทนา",
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
              const Color(0xFFE8EAF6),
            ],
          ),
        ),
        child: Stack(
          children: [
            showdata(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.comment),
        onPressed: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (BuildContext context) => TalkPost());
          Navigator.push(context, route).then((value) {
            setState(() {
              dataread();
            });
          });
        },
      ),
    );
  }
}
