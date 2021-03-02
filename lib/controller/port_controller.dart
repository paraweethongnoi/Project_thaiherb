import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PortController {
  BuildContext _context;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  PortController(BuildContext context) : _context = context;

  String dateTimeConvert(String datetime) {
    var datesSplit = datetime.split(",");
    int year = int.parse(datesSplit[0]);
    int month = int.parse(datesSplit[1]);
    int day = int.parse(datesSplit[2]);
    int hour = int.parse(datesSplit[3]);
    int minute = int.parse(datesSplit[4]);
    var date = DateTime(year, month, day, hour, minute);
    var now = DateTime.now();
    String resolt;
    if (now.difference(date).inDays != 0) {
      resolt = "โพส์เมื่อ ${DateFormat('dd MMMM yyyy').format(date)}";
    } else if (now.difference(date).inHours != 0) {
      resolt = "โพส์เมื่อ ${now.difference(date).inHours} ชั่วโมงที่แล้ว";
    } else if (now.difference(date).inMinutes != 0) {
      resolt = "โพส์เมื่อ ${now.difference(date).inMinutes} นาทีที่แล้ว";
    } else {
      resolt = "โพส์เมื่อสักครู่";
    }
    return resolt;
  }

  Future<void> showAlert(String title, String message) async {
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(_context).pop();
                },
                child: Text('ตกลง'),
              )
            ],
          );
        });
  }

  Future<List> readAllData() async {
    List data = [];
    await firestore
        .collection("talk")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> map = Map();
                map = doc.data();
                map["docid"] = doc.id;
                data.add(map);
                data.sort((m1, m2) => m2["talkId"].compareTo(m1["talkId"]));
              })
            });
    return data;
  }

  Future<Map<String, dynamic>> readPostData(String docId) async {
    final data = await firestore.collection("talk").doc(docId).get();
    return data.data();
  }

  Future<bool> uploadData(
      {TextEditingController textbox, String status, String docid}) async {
    int talkId = 1;
    var now = DateTime.now();
    List coments = [];
    bool statusUpload;
    Map<String, dynamic> map = Map();
    if (textbox.text != "") {
      map["talkDetail"] = textbox.text;
      map["datetime"] =
          "${now.year},${now.month},${now.day},${now.hour},${now.minute}";
      coments.add(map);
      if (status == "Post") {
        var checkListTalk = await firestore.collection("talk").get();
        if (checkListTalk.docChanges.isNotEmpty) {
          map["talkId"] = checkListTalk.docs.length + talkId;
        } else {
          map["talkId"] = talkId;
        }
        map["coments"] = FieldValue.arrayUnion([]);
        await firestore.collection("talk").doc().set(map).then((value) {
          statusUpload = true;
          Navigator.pop(_context);
        });
      } else if (status == "Coments") {
        await firestore
            .collection("talk")
            .doc(docid)
            .update({"coments": FieldValue.arrayUnion(coments)}).then((value) {
          statusUpload = true;
        });
      } else {
        showAlert("ไม่สำเร็จ", "ค่า Status ไม่ถูกต้อง");
        statusUpload = false;
      }
    } else {
      showAlert("ไม่สำเร็จ", "กรุณากรอกข้อความ");
      statusUpload = false;
    }
    return statusUpload;
  }
}
