import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Howtoeat extends StatefulWidget {
  Map<String, dynamic> product;
  Howtoeat(this.product);

  @override
  _HowtoeatState createState() => _HowtoeatState();
}

class _HowtoeatState extends State<Howtoeat> {
  @override
  void initState() {
    super.initState();
    print(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFFaad100),
        title: Text(
          widget.product["Name"],
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontFamily: 'Kanit',
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFE0FFFF),
              const Color(0xFFd8ea8a),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              widget.product["Name"],
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "รูปแบบและขนาดวิธีใช้ยา : ",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.green[700],
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.product["eat"],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[700],
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Divider(color: Colors.black38),
                          SizedBox(height: 10),
                          Text(
                            "ข้อควรระวัง : ",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.red[600],
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Text(
                            widget.product["beware"],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[700],
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Divider(color: Colors.black38),
                          SizedBox(height: 10),
                          Text(
                            "Gallery",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.blue[700],
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              height: 300,
                              child: ListView.builder(
                                  itemCount: widget.product.length,
                                  itemBuilder: (ontext, index) {
                                    return Column(
                                      children: [
                                        Card(
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                          child: Image.network(
                                            widget.product["PathImage"],
                                          ),
                                        ),
                                        Card(
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                          child: Image.network(
                                              widget.product["PathImage2"]),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
