import 'package:flutter/material.dart';
void main() {
runApp(MyApp());
}
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 
return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('Gradient RaisedButton Example'),
    ),
    body: Center(
      child: RaisedButton(
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        shape: StadiumBorder(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
               colors: [Colors.yellow.shade100, Colors.green]
            ),
          ),
          child: Text(
            'ANDROIDRIDE',
            style: TextStyle(fontSize: 15.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
        ),
        onPressed: () {
          print('Gradient RaisedButton clicked');
        },
      ),
    ),
  ),
);
  }
}