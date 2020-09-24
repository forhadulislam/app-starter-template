import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_starter_template/pages/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTimer(2);
  }

  startTimer(int durationSecond) async {
    var duration = Duration(seconds: durationSecond);
    return Timer( duration, route );
  }

  route(){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Home()));
  }


  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ],
            )),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CupertinoPageScaffold(
              child: new Icon(
                Icons.ac_unit,
                color: Colors.white,
                size: 90,
              ),
              backgroundColor: Colors.transparent,
            ),
            Text(
              'Point',
              style: TextStyle(
                fontFamily: "Signatra",
                fontSize: 90.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
