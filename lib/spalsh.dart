import 'dart:async';

import 'package:books_mini_project_ui/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff5b5ea6),
                Colors.black,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/CEB_Logo.png",
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Computer Engineering e-Books",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lora",
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      SpinKitThreeBounce(
                        color: Colors.white,
                        size: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
