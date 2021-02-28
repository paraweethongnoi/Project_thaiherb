import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tess/screens/bmi1.dart';
import 'package:tess/screens/components/manu.dart';
import 'package:tess/widget/signin_addmin.dart';

class Adddata extends StatefulWidget {
  @override
  _AdddataState createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
  File file;
  File image;
  // File _imgReceipt;
  List<bool> isSelected = [true, false];
  int boxbtnsta = 0;
  String name,
      detail,
      detail2,
      englishname,
      familyname,
      important,
      partused,
      synonyms1,
      beware1,
      eat1,
      look1,
      status1,
      status22,
      style1,
      smoking1,
      urlPcture,
      urlPcture2;

  Widget uploadButton() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: RaisedButton.icon(
            color: Colors.green[800],
            onPressed: () {
              print('you click');

              if (file == null) {
                showAlert('คุณยังไม่ได้เลือกรูป',
                    'กรุณาเลือกรูปภาพ หรือ Upload รูปภาพ');
              } else if(image == null){
                showAlert('คุณยังไม่ได้เลือกรูปที่2',
                    'กรุณากดที่ รูปที่2 เลือกรูปภาพ หรือ Upload รูปภาพ');
              } else if (name == null ||
                  name.isEmpty ||
                  detail == null ||
                  detail.isEmpty ||
                  detail2 == null ||
                  detail2.isEmpty) {
                showAlert('คุณกรอกข้อมูลไม่ครบ', 'กรุณากรอกข้อมูลให้ครบถ้วน');
              } else {
                //uploandPicture();
                uploadPictureToStore();
              }
            },
            icon: Icon(
              Icons.cloud_upload,
              color: Colors.white,
            ),
            label: Text(
              'เพิ่ม ข้อมูลสมุนไพร',
              style: TextStyle(
                color: Colors.white,
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

  Future<void> uploadPictureToStore() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    await firebaseStorage.ref().child('Product/product$i.jpg').putFile(file);
    urlPcture = await firebaseStorage
        .ref()
        .child('Product/product$i.jpg')
        .getDownloadURL();
    await firebaseStorage.ref().child('Product/product2$i.jpg').putFile(image);
    urlPcture2 = await firebaseStorage
        .ref()
        .child('Product/product$i.jpg')
        .getDownloadURL();
    await setupDisplayName();
  }

  Future<void> setupDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var user = firebaseAuth.currentUser;
    DocumentReference ref = firestore.collection('Product').doc();

    Map<String, dynamic> map = Map();
    map['Name'] = name;
    map['Detail'] = detail;
    map['Detail2'] = detail2;
    map['PathImage'] = urlPcture;
    map['PathImage2'] = urlPcture2;
    map['Englishname'] = englishname;
    map['Familyname'] = familyname;
    map['Important'] = important;
    map['Partused'] = partused;
    map['look'] = look1;
    map['eat'] = eat1;
    // map['status'] = status1;
    // map['status2'] = status22;
    map['beware'] = beware1;
    // map['smoking'] = smoking1;
    map['style'] = style1;
    map['Synonyms'] = synonyms1;

    await firestore.collection("Product").doc().set(map).then((value) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Bmi1());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
    print("OK");
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
      width: MediaQuery.of(context).size.width * 0.9,
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
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onChanged: (String string) {
          detail = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'ชื่อวิทยาศาสตร์ : ',
          icon: Icon(
            Icons.drive_file_rename_outline,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget detail2Form() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onChanged: (String string) {
          detail2 = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'ชื่อท้องถิ่น : ',
          icon: Icon(
            Icons.local_airport,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  Widget englishnameForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onChanged: (String string) {
          englishname = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'ชื่ออังกฤษ : ',
          icon: Icon(
            Icons.badge,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget familynameForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onChanged: (String string) {
          familyname = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'ชื่อวงศ์ : ',
          icon: Icon(
            Icons.group,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }

  Widget importantForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onChanged: (String string) {
          important = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'สารสำคัญที่ออกฤทธิ์ : ',
          icon: Icon(
            Icons.new_releases,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }

  Widget partusedForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onChanged: (String string) {
          partused = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'ส่วนที่ใช้เป็นยาและสรรพคุณ : ',
          icon: Icon(Icons.celebration, color: Colors.teal),
        ),
      ),
    );
  }

  Widget lookForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onChanged: (String string) {
          look1 = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'ลักษณะทางพฤกษศาสตร์ : ',
          icon: Icon(
            Icons.local_florist,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  Widget eatForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onChanged: (String string) {
          eat1 = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'รูปแบบและขนาดวิธีใช้ยา : ',
          icon: Icon(
            Icons.restaurant,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }

  Widget bewareForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onChanged: (String string) {
          beware1 = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'ข้อควรระวัง : ',
          icon: Icon(
            Icons.add_alert,
            color: Colors.red[700],
          ),
        ),
      ),
    );
  }

  // Widget statusForm() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width * 0.9,
  //     child: TextField(
  //       onChanged: (String string) {
  //         status1 = string.trim();
  //       },
  //       decoration: InputDecoration(
  //         labelText: 'ข้อควรระวัง : ',
  //         icon: Icon(
  //           Icons.add_alert,
  //           color: Colors.red[700],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget status2Form() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width * 0.9,
  //     child: TextField(
  //       onChanged: (String string) {
  //         status22 = string.trim();
  //       },
  //       decoration: InputDecoration(
  //         labelText: 'ข้อควรระวัง : ',
  //         icon: Icon(
  //           Icons.add_alert,
  //           color: Colors.red[700],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget styleForm() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width * 0.9,
  //     child: TextField(
  //       onChanged: (String string) {
  //         style1 = string.trim();
  //       },
  //       decoration: InputDecoration(
  //         labelText: 'ข้อควรระวัง : ',
  //         icon: Icon(
  //           Icons.add_alert,
  //           color: Colors.red[700],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget smokingForm() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width * 0.9,
  //     child: TextField(
  //       onChanged: (String string) {
  //         smoking1 = string.trim();
  //       },
  //       decoration: InputDecoration(
  //         labelText: 'ข้อควรระวัง : ',
  //         icon: Icon(
  //           Icons.add_alert,
  //           color: Colors.red[700],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget synonymsForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onChanged: (String string) {
          synonyms1 = string.trim();
        },
        decoration: InputDecoration(
          labelText: 'ชื่อพ้อง : ',
          icon: Icon(
            Icons.announcement,
            color: Colors.blueGrey,
          ),
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
        if(boxbtnsta == 0){
          file = File(object.path);
        }else{
          image = File(object.path);
        }
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
          : boxbtnsta == 0 ? Image.file(file) : 
          image == null 
          ? Image.asset('assets/images/imageadd.png')
          : Image.file(image),
    );
  }

  Widget showContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // RaisedButton(
            //   color: Colors.white,
            //   onPressed: () {
            //     MaterialPageRoute materialPageRoute = MaterialPageRoute(
            //         builder: (BuildContext context) => Admin());
            //     Navigator.of(context).push(materialPageRoute);
            //   },
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(40)),
            //   elevation: 16,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: <Widget>[
            //       SvgPicture.asset(
            //         'assets/images/admin.svg',
            //         height: 40,
            //       ),
            //       Text(
            //         'สำหรับผู้ดูแลระบบ',
            //         style: TextStyle(
            //           fontSize: 12.0,
            //           color: Colors.blue[800],
            //           fontFamily: 'Kanit',
            //           // fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Center(
              child: Container(
                color: Colors.grey.shade300,
                child: ToggleButtons(
                  fillColor: Colors.white,
                  selectedColor: Colors.black,
                  children: <Widget>[
                    Text("รูปที่1"),
                    Text("รูปที่2"),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      if(index != boxbtnsta){
                        boxbtnsta = index;
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected[buttonIndex] = !isSelected[buttonIndex];
                        } else {
                          isSelected[buttonIndex] = false;
                        }
                      }}
                    });
                  },
                  isSelected: isSelected,
                ),
              ),
            ),
            showImage(),
            showButton(),
            uploadButton(),
            nameForm(),
            detailForm(),
            detail2Form(),
            englishnameForm(),
            familynameForm(),
            synonymsForm(),
            importantForm(),
            partusedForm(),
            lookForm(),
            eatForm(),
            bewareForm(),
            // statusForm(),
            // status2Form(),
            // styleForm(),
            // smokingForm(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        // leading: Icons.arrow_back,
        elevation: 0.0,
        backgroundColor: Colors.lightGreenAccent,
        title: Text(
          'เพิ่มข้อมูลสมุนไพร',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontFamily: 'Kanit',
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          showContent(),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.lightGreenAccent;
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
