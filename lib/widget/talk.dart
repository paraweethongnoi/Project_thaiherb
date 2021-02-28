import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tess/widget/talk_post.dart';

class Talk extends StatefulWidget {
  Talk({Key key}) : super(key: key);

  @override
  _TalkState createState() => _TalkState();
}

class _TalkState extends State<Talk> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List talks = [];

  Future<void> readAllData() async {
    // ignore: deprecated_member_use
    final collectionReference = await firestore
        .collection("talk")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> map = Map();
                map = doc.data();
                setState(() {
                  talks.add(map);
                  talks.sort((m1,m2)=>m2["talkId"].compareTo(m1["talkId"]));
                });
                print(talks.toList());
              })
            });
  }

  String dateTimeConvert(String datetime){
    var datesSplit = datetime.split(",");
    int year = int.parse(datesSplit[0]);
    int month = int.parse(datesSplit[1]);
    int day = int.parse(datesSplit[2]);
    int hour = int.parse(datesSplit[3]);
    int minute = int.parse(datesSplit[4]);
    var date = DateTime(year,month,day,hour,minute);
    var now = DateTime.now();
    String resolt ;
      if(now.difference(date).inDays != 0){
          resolt = "โพส์เมื่อ ${DateFormat('dd MMMM yyyy').format(date)}";
      }else if(now.difference(date).inHours != 0){
        resolt = "โพส์เมื่อ ${now.difference(date).inHours} ชั่วโมงที่แล้ว";
      }else if(now.difference(date).inMinutes != 0){
        resolt = "โพส์เมื่อ ${now.difference(date).inMinutes} นาทีที่แล้ว";
      }
      else{
        resolt = "โพส์เมื่อสักครู่";
      }
      return resolt;
  }

  @override
  void initState() { 
    super.initState();
    readAllData();
  }

Widget showdata() {
    return ListView.builder(
        itemCount: talks.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            child: SizedBox(
              height: 65,
              child: Card(
                child:Container(
                  padding: EdgeInsets.only(left:18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(dateTimeConvert(talks[index]["datetime"])),
                      Text(talks[index]["talkDetail"]),
                    ],
                  ),
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
        title: Text("บทสนทนา"),
      ),
      body: showdata(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.comment),
        onPressed: (){
            MaterialPageRoute route = MaterialPageRoute(builder: (BuildContext context)=>TalkPost());
            Navigator.push(context, route).then((value){
              setState(() {
                talks = [];
                readAllData();
              });
            });
        },
      ),
    );
  }
}
