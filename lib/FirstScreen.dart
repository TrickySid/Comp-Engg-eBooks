import 'package:books_mini_project_ui/about.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:url_launcher/url_launcher.dart';

class FirstScreen extends StatelessWidget {
  final double _borderRadius = 24.0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    fntsz = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height * 0.035
        : MediaQuery.of(context).size.width * 0.035;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: mediaQuery.size.height / 2,
                width: mediaQuery.size.width,
                decoration: BoxDecoration(
                  color: Color(0xff5b5ea6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/CEB_Logo.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Computer Engineering e-Books",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lora",
                        fontSize: fntsz,
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
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => About()));
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(_borderRadius),
                            gradient: LinearGradient(
                                colors: [Color(0xffce5b78), Colors.red[400]],
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
                            _borderRadius, Colors.pink, Colors.red),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => About()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 50, left: 20),
                        child: ListTile(
                          leading: Image.asset(
                            "assets/book.png",
                            height: 100.0,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            "About ",
                            style: TextStyle(
                              fontFamily: "Lora",
                              color: Colors.white,
                              fontSize: fntsz,
                            ),
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
                    InkWell(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => sem4()));
                        _launchURL('mailto:rudratejchilkewar@gmail.com');
                      },
                      child: Container(
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
                      onTap: () =>
                          _launchURL('mailto:rudratejchilkewar@gmail.com'),
                      child: Container(
                        padding: EdgeInsets.only(top: 50, left: 20),
                        child: ListTile(
                          leading: Image.asset(
                            "assets/bulb.png",
                            height: 100.0,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            "Suggest a change",
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
          ],
        ),
      ),
    );
  }
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);
  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;
    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - (size.height / 4));
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
    //throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
    //throw UnimplementedError();
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
