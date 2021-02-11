import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Adddata extends StatefulWidget {
  @override
  _AdddataState createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
  File file;
  String name, detail, detail2, urlPcture;

  Widget uploadButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: RaisedButton.icon(
            color: Colors.limeAccent,
            onPressed: () {
              print('ํyou click');

              if (file == null) {
                showAlert('คุณยังไม่ได้เลือกรูป',
                    'กรุณาเลือกรูปภาพ หรือ Upload รูปภาพ');
              } else if (name == null ||
                  name.isEmpty ||
                  detail == null ||
                  detail.isEmpty ||
                  detail2 == null ||
                  detail2.isEmpty) {
                showAlert('คุณกรอกข้อมูลไม่ครบ', 'กรุณากรอกข้อมูลให้ครบถ้วน');
              } else {
                uploandPicture();
              }
            },
            icon: Icon(Icons.cloud_upload),
            label: Text(
              'เพิ่ม ข้อมูลสมุนไพร',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> uploandPicture() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('Product/product$i.jpg');
    UploadTask uploadTask = ref.putFile(file);
 
    uploadTask.then((res) {
      res.ref.getDownloadURL();
    });
    print('urlPcture =$urlPcture');
  }

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

  Widget nameForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextField(
        onChanged: (String string) {
          name = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'Name',
          icon: Icon(Icons.park),
        ),
      ),
    );
  }

  Widget detailForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextField(
        onChanged: (String string) {
          detail = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'ชื่อวิทยาศาสตร์ : ',
          icon: Icon(Icons.drive_file_rename_outline),
        ),
      ),
    );
  }

  Widget detail2Form() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextField(
        onChanged: (String string) {
          detail2 = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'ชื่อท้องถิ่น : ',
          icon: Icon(Icons.local_airport),
        ),
      ),
    );
  }

  Widget cameraButton() {
    return IconButton(
      icon: Icon(
        Icons.add_a_photo,
        size: 40.0,
        color: Colors.green,
      ),
      onPressed: () {
        chooseImage(ImageSource.camera);
      },
    );
  }

  Future<void> chooseImage(ImageSource imageSource) async {
    try {
      var object = await ImagePicker().getImage(
        source: imageSource,
        maxWidth: 800.0,
        maxHeight: 800.0,
      );

      setState(() {
        file = File(object.path);
      });
    } catch (e) {}
  }

  Widget galleryButton() {
    return IconButton(
      icon: Icon(
        Icons.add_photo_alternate,
        size: 40.0,
        color: Colors.yellow[700],
      ),
      onPressed: () {
        chooseImage(ImageSource.gallery);
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[cameraButton(), galleryButton()],
    );
  }

  Widget showImage() {
    return Container(
      //color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: file == null
          ? Image.asset('assets/images/imageadd.png')
          : Image.file(file),
    );
  }

  Widget showContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          showImage(),
          showButton(),
          nameForm(),
          detailForm(),
          detail2Form(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.limeAccent,
      ),
      body: Stack(
        children: <Widget>[
          showContent(),
          uploadButton()
          // CustomPaint(
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height,
          //   ),
          //   painter: HeaderCurvedContainer(),
          // ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.limeAccent;
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
