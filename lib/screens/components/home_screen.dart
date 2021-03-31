import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tess/screens/components/5moo.dart';
import 'package:tess/screens/components/meal.dart';
import 'package:tess/screens/detail_home/meal_detail_screen.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:animations/animations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<HomeScreen> {
  String login = '...';
  final today = DateTime.now();
  List home = [];

//  @override
//   void initState() {
//     super.initState();
//     readAllData();
//   }

//   Future<void> readAllData() async {
//     // ignore: deprecated_member_use
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     final collectionReference = await firestore
//         .collection("Home")
//         .get()
//         .then((QuerySnapshot querySnapshot) => {
//               querySnapshot.docs.forEach((doc) {
//                 setState(() {
//                   home.add(doc.data());
//                 });
//                 print(home.toList());
//               })
//             });
//   }
  // @override
  // void initState() {
  //   super.initState();
  //   //findDisplayName();
  // }

  // Future<void> findDisplayName() async {
  //   FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //   final user = await _firebaseAuth.currentUser;
  //   setState(() {
  //     login = user.displayName;
  //   });
  //   print('login = $login');
  // }

  Widget showLongin() {
    return Text(
      'สวัสดี, ยินดีต้อนรับ',
      style: TextStyle(
        fontSize: 35.0,
        letterSpacing: 1.5,
        color: Colors.black,
        fontFamily: 'Kanit',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMM yyy").format(today)}",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey[100],
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(
                  top: 80, //
                  //   left: 20, //right: 16, bottom: 16
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // _RadiaProgress(
                        //   width: MediaQuery.of(context).size.width - 250,
                        //  height: height * 0.3,
                        //  progress: 0.65,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75.0),
                              color: Colors.amber,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Covid-19",
                                  style: TextStyle(
                                       fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                Text(
                                  "สัญณาณบ่งชี้",
                                  style: TextStyle(
                                    //  fontSize: 20.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "เบื้องต้น",
                                  style: TextStyle(
                                    //   fontSize: 20.0,
                                    color: Colors.blue[800],
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _IngredientProgress(
                              ingredient: "มีไข้",
                              progress: 0.88,
                              progressColor: Colors.pink[900],
                              leftAmount: 88,
                              width: MediaQuery.of(context).size.width - 250,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            _IngredientProgress(
                              ingredient: "ไอแห้ง",
                              progress: 0.68,
                              progressColor: Colors.blue,
                              leftAmount: 68,
                              width: MediaQuery.of(context).size.width - 250,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            _IngredientProgress(
                              ingredient: "ไม่มีเรี่ยวแรง",
                              progress: 0.38,
                              progressColor: Colors.yellow[900],
                              leftAmount: 38,
                              width: MediaQuery.of(context).size.width - 250,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            _IngredientProgress(
                              ingredient: "ไอแบบมีเสมหะ",
                              progress: 0.33,
                              progressColor: Colors.green,
                              leftAmount: 33,
                              width: MediaQuery.of(context).size.width - 250,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            _IngredientProgress(
                              ingredient: "หายใจลำบาก",
                              progress: 0.18,
                              progressColor: Colors.red,
                              leftAmount: 18,
                              width: MediaQuery.of(context).size.width - 250,
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: height * 0.50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                              left: 32,
                              right: 16,
                            ),
                            child: Text(
                              'สาระน่ารู้',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 32,
                                  ),
                                  for (int i = 0; i < meals.length; i++)
                                    _MealCard(
                                      meal: meals[i],
                                    ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          OpenContainer(
                            closedElevation: 0,
                            transitionType: ContainerTransitionType.fade,
                            transitionDuration:
                                const Duration(milliseconds: 1000),
                            openBuilder: (context, _) {
                              return MOO5();
                            },
                            closedBuilder:
                                (context, VoidCallback openContainer) {
                              return GestureDetector(
                                child: GestureDetector(
                                  onTap: openContainer,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          const Color(0xFF00000),
                                          const Color(0xFFFFB590),
                                        ],
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "สุขภาพดี๊ดี ต้องมีครบ 5 หมู่",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                              fontFamily: 'Kanit',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: SvgPicture.asset(
                                                  'assets/images/protein.svg',
                                                  height: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: SvgPicture.asset(
                                                  'assets/images/rye.svg',
                                                  height: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: SvgPicture.asset(
                                                  'assets/images/salad.svg',
                                                  height: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: SvgPicture.asset(
                                                  'assets/images/strawberries.svg',
                                                  height: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: SvgPicture.asset(
                                                  'assets/images/trans-fat.svg',
                                                  height: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              painter: HeaderCurvedContainer(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  showLongin(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final double leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {Key key,
      this.ingredient,
      this.leftAmount,
      this.progress,
      this.width,
      this.progressColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.red[900],
            fontFamily: 'Kanit',
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "$leftAmount% ",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }
}

class _RadiaProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadiaProgress({Key key, this.height, this.width, this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadiaPainter(
        progress: 0.65,
      ),
      child: Container(
        // height: height,
        // width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: "Covid-19",
                style: TextStyle(
                    //  fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              TextSpan(text: "\n"),
              TextSpan(
                text: "สัญณาณบ่งชี้",
                style: TextStyle(
                  //  fontSize: 20.0,
                  color: Colors.blue[800],
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: "\n"),
              TextSpan(
                text: "เบื้องต้น",
                style: TextStyle(
                  //   fontSize: 20.0,
                  color: Colors.blue[800],
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _RadiaPainter extends CustomPainter {
  final double progress;

  _RadiaPainter({this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    // ignore: unused_local_variable
    Paint paint = Paint()
      ..strokeWidth = 12
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    // ignore: unused_local_variable
    double relativeProgress = 360 * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: OpenContainer(
                closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                transitionDuration: const Duration(milliseconds: 1000),
                openBuilder: (context, _) {
                  return MealDetailScreen(
                    meal: meal,
                  );
                },
                closedBuilder: (context, openContainer) {
                  return GestureDetector(
                    onTap: openContainer,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        meal.imagePath,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      meal.mealTime,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                      ),
                    ),
                    Text(
                      meal.name,
                      style: const TextStyle(
                        fontFamily: 'Kanit',
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.greenAccent;
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
