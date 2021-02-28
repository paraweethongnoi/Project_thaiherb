import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TalkPost extends StatefulWidget {
  TalkPost({Key key}) : super(key: key);

  @override
  _TalkPostState createState() => _TalkPostState();
}

class _TalkPostState extends State<TalkPost> {
 FirebaseFirestore firestore = FirebaseFirestore.instance;
  final textbox = TextEditingController();
  final maxLines = 90;
  //formdatetime(y,m,d,h,m)//

  Future<void> showAlert(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('ตกลง'),
              )
            ],
          );
        });
  }

  void uploadData()async{
    int talkId = 1 ;
    var now = DateTime.now();
    Map<String,dynamic> map = Map();
      if(textbox.text != ""){
       var checkListTalk = await firestore.collection("talk").get();
        if(checkListTalk.docChanges.isNotEmpty){
          map["talkId"] = checkListTalk.docs.length+talkId;
        }else{
          map["talkId"] = talkId;            
        }
        map["talkDetail"] = textbox.text;
        map["datetime"] = "${now.year},${now.month},${now.day},${now.hour},${now.minute}";
        await firestore.collection("talk").doc().set(map).then((value){
            Navigator.pop(context);
        });
      }else{
          showAlert("ไม่สำเร็จ", "กรุณากรอกข้อความ");
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("สร้างบทสนทนา"),),
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
            onPressed:()=>uploadData(),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}