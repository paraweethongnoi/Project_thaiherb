import 'package:flutter/material.dart';
import 'package:tess/controller/port_controller.dart';

class TalkPostDocId extends StatefulWidget {
  final String docId;
  TalkPostDocId(this.docId);

  @override
  _TalkPostDocIdState createState() => _TalkPostDocIdState();
}

class _TalkPostDocIdState extends State<TalkPostDocId> {
  PortController portController;
  Map<String, dynamic> post = Map();
  List coments = [];
  final textbox = TextEditingController();

  void readData() async {
    post = await portController.readPostData(widget.docId);
    coments = post["coments"];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    portController = PortController(context);
    readData();
  }

  Widget showdata() {
    return post["talkDetail"] == null
        ? Container()
        : Container(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            child: Card(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(portController.dateTimeConvert(post["datetime"])),
                      Text(post["talkDetail"])
                    ],
                  )),
            ),
          );
  }

  Widget showcoments() {
    return Column(
        children: List.generate(coments.length, (index) {
      int last = coments.length;
      return Container(
        padding: EdgeInsets.only(left: 25),
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(portController.dateTimeConvert(
                          coments[last - (index + 1)]["datetime"])),
                      Text(coments[last - (index + 1)]["talkDetail"])
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [showdata(), showcoments()],
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: textbox,
                decoration: InputDecoration(hintText: "แสดงความคิดเห็น"),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: Colors.blue),
              onPressed: () => portController
                  .uploadData(
                      textbox: textbox, status: "Coments", docid: widget.docId)
                  .then((value) {
                setState(() {
                  textbox.text = "";
                  readData();
                });
              }),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
