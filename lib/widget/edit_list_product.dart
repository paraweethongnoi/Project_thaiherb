import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tess/screens/bmi1.dart';

class EditListProduct extends StatefulWidget {
  final Map<String,dynamic> product;
  EditListProduct(this.product);

  @override
  _EditListProductState createState() => _EditListProductState();
}

class _EditListProductState extends State<EditListProduct> {
  File file;
  // File _image;
  // File _imgReceipt;
  final name = TextEditingController();
  final detail = TextEditingController();
  final detail2 = TextEditingController();
  final englishname = TextEditingController();
  final familyname = TextEditingController();
  final important = TextEditingController();
  final partused = TextEditingController();
  final synonyms1 = TextEditingController();
  final beware1 = TextEditingController();
  final eat1 = TextEditingController();
  final look1 = TextEditingController();
  final status1 = TextEditingController();
  final status22 = TextEditingController();
  final style1 = TextEditingController();
  final smoking1 = TextEditingController();
  String urlPcture ;
  final urlPcture2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    name.text = widget.product['Name'];
    detail.text = widget.product['Detail'];
    detail2.text = widget.product['Detail2'];
    urlPcture = widget.product['PathImage'];
    englishname.text = widget.product['Englishname'];
    familyname.text = widget.product['Familyname'];
    important.text = widget.product['Important'];
    partused.text = widget.product['Partused'];
    look1.text = widget.product['look'];
    eat1.text = widget.product['eat'];
    beware1.text = widget.product['beware'];
    style1.text = widget.product['style'];
    synonyms1.text = widget.product['Synonyms'];
    setState(() {});
  }

  Widget uploadButton() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: RaisedButton.icon(
            color: Colors.green[800],
            onPressed: () {
              print('you click');

              if (name.text == "" ||
                  name.text.isEmpty ||
                  detail.text == "" ||
                  detail.text.isEmpty ||
                  detail2.text == "" ||
                  detail2.text.isEmpty) {
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

    if (file == null) {
      urlPcture = widget.product['PathImage'];
    } else{ 
    await firebaseStorage.ref().child('Product/product$i.jpg').putFile(file);
    urlPcture = await firebaseStorage
        .ref()
        .child('Product/product$i.jpg')
        .getDownloadURL();
    print('urlPcture =$urlPcture');
    }
    await setupDisplayName();
  }

  Future<void> setupDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var user = firebaseAuth.currentUser;
    DocumentReference ref = firestore.collection('Product').doc();

    Map<String, dynamic> map = Map();
    map['Name'] = name.text;
    map['Detail'] = detail.text;
    map['Detail2'] = detail2.text;
    map['PathImage'] = urlPcture;
    map['Englishname'] = englishname.text;
    map['Familyname'] = familyname.text;
    map['Important'] = important.text;
    map['Partused'] = partused.text;
    map['look'] = look1.text;
    map['eat'] = eat1.text;
    // map['status'] = status1;
    // map['status2'] = status22;
    map['beware'] = beware1.text;
    // map['smoking'] = smoking1;
    map['style'] = style1.text;
    map['Synonyms'] = synonyms1.text;

    await firestore.collection("Product").doc(widget.product['docid']).update(map).then((value) {
      Navigator.pop(context);
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
        controller: name,
        onChanged: (String string) {
          name.text = string.trim();
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
        controller: detail,
        onChanged: (String string) {
          detail.text = string.trim();
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
        controller: detail2,
        onChanged: (String string) {
          detail2.text = string.trim();
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
        controller: englishname,
        onChanged: (String string) {
          englishname.text = string.trim();
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
        controller: familyname,
        onChanged: (String string) {
          familyname.text = string.trim();
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
        controller: important,
        onChanged: (String string) {
          important.text = string.trim();
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
        controller: partused,
        onChanged: (String string) {
          partused.text = string.trim();
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
        controller: look1,
        onChanged: (String string) {
          look1.text = string.trim();
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
        controller: eat1,
        onChanged: (String string) {
          eat1.text = string.trim();
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
        controller: beware1,
        onChanged: (String string) {
          beware1.text = string.trim();
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
        controller: synonyms1,
        onChanged: (String string) {
          synonyms1.text= string.trim();
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
          ? Image.network(urlPcture)
          : Image.file(file),
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
