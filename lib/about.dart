import 'package:flutter/material.dart';
import 'FirstScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

var fntsz;
String abttext =
    "The books provided in this app organized in keeping an  account of the syllabus of the University of Mumbai and other reputed universities across India.\nHence, this app is useful for all students, just they have to find their required books in specifc semesters according to their syllabus.\n\nThis app not for any commercial purposes, Only for knowledge sharing purposes.\n All books in this app was found online, no material was recreated by the developer,No copyright infringement is intended.\n\nAlthough,if any author or publisher wants to remove their book they can contact by clicking suggest a change on the homescreen..";

class About extends StatelessWidget {
  final double _borderRadius = 24.0;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    fntsz = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height * 0.030
        : MediaQuery.of(context).size.width * 0.030;
    return Scaffold(
      body: Container(
        height: mediaQuery.size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueGrey, Color(0xff5b5ea6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Image.asset(
                    "assets/CEB_Logo.png",
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Computer Engineering e-Books",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Lora",
                    fontSize: fntsz,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: ListTile(
                        title: Text(
                          abttext,
                          style: TextStyle(
                              fontFamily: "Lora",
                              color: Colors.white,
                              fontSize: fntsz),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                width: mediaQuery.size.width,
                color: Colors.white30,
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                height: 1,
                width: mediaQuery.size.width,
                color: Colors.white30,
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                height: 1,
                width: mediaQuery.size.width,
                color: Colors.white30,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Share.share(
                              "Hey, check out this app,It contains all the Computer Engineering Books we need. Download From here:  https://github.com/rudratejC  ");
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(_borderRadius),
                              gradient: LinearGradient(
                                  colors: [Colors.black, Colors.grey],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.8),
                                  blurRadius: 12,
                                  offset: Offset(0, 6),
                                ),
                              ]),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: CustomPaint(
                          size: Size(100, 150),
                          painter: CustomCardShapePainter(
                              _borderRadius, Colors.black, Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Share.share(
                              "Hey, check out this app,It contains all the Computer Engineering Books we need. Download From here:  https://github.com/rudratejC  ");
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 50, left: 20),
                          child: ListTile(
                            leading: Icon(
                              Icons.share_rounded,
                              color: Colors.white,
                            ),
                            //Image.asset(
                            //   "assets/bulb.png",
                            //   height: 100.0,
                            //   fit: BoxFit.fill,
                            // ),
                            title: Text(
                              "Help us and your\nFriends by sharing this app",
                              style: TextStyle(
                                  fontFamily: "Lora",
                                  color: Colors.white,
                                  fontSize: fntsz),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(_borderRadius),
                            gradient: LinearGradient(
                                colors: [Colors.black, Colors.grey],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.8),
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              ),
                            ]),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: CustomPaint(
                          size: Size(100, 150),
                          painter: CustomCardShapePainter(
                              _borderRadius, Colors.black, Colors.grey),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                "Developer: \nRudratej Chilkewar",
                                style: TextStyle(
                                    fontFamily: "Lora",
                                    color: Colors.white,
                                    fontSize: fntsz),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () => _launchURL(
                                      "https://github.com/rudratejC"),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset(
                                      "assets/github.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () => _launchURL(
                                      "https://www.linkedin.com/in/rudratej-chilkewar-176ab7193/"),
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                        "assets/linkedIn.png",
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  var link = url;
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Could not launch $link';
  }
}
//flutter build apk --analyze-size --target-platform=android-arm64
