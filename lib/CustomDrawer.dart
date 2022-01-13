import 'package:books_mini_project_ui/pages/sem1.dart';
import 'package:books_mini_project_ui/pages/sem2.dart';
import 'package:books_mini_project_ui/pages/sem3.dart';
import 'package:books_mini_project_ui/pages/sem4.dart';
import 'package:books_mini_project_ui/pages/sem5.dart';
import 'package:books_mini_project_ui/pages/sem6.dart';
import 'package:books_mini_project_ui/pages/sem7.dart';
import 'package:books_mini_project_ui/pages/sem8.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var fntsz = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height * 0.035
        : MediaQuery.of(context).size.width * 0.035;
    return Container(
      //color: Colors.black,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff5b5ea6), Colors.black],
            begin: Alignment.centerLeft,
          ),
          //borderRadius: BorderRadius.vertical(),
          borderRadius: new BorderRadius.only(
              bottomRight: const Radius.circular(250.0),
              topRight: const Radius.circular(250.0))),
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Container(
            //     width: double.infinity,
            //     height: 150,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         SizedBox(
            //           height: 50,
            //         ),
            //         Image.asset(
            //           "assets/CEB_Logo.png",
            //           width: 80,
            //           height: 80,
            //         ),
            //         Text(
            //           "Computer Engineering Books",
            //           style: TextStyle(
            //                   fontFamily: "Lora",
            //               color: Colors.white, fontWeight: FontWeight.bold),
            //         )
            //       ],
            //     )),
            SizedBox(
              height: mediaQuery.size.height / 8,
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            ListTile(
              onTap: () {
                debugPrint("SEM I");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sem1()));
                closeDrawer();
              },
              leading: Icon(
                Icons.article,
                color: Colors.white,
              ),
              title: Text(
                "Sem I",
                style: TextStyle(
                  fontFamily: "Lora",
                  color: Colors.white,
                  fontSize: fntsz,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            ListTile(
              onTap: () {
                debugPrint("SEM II");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sem2()));
                closeDrawer();
              },
              leading: Icon(
                Icons.article,
                color: Colors.white,
              ),
              title: Text(
                "Sem II",
                style: TextStyle(
                  fontFamily: "Lora",
                  color: Colors.white,
                  fontSize: fntsz,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            ListTile(
              onTap: () {
                debugPrint("SEM III");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sem3()));
                closeDrawer();
              },
              leading: Icon(
                Icons.article,
                color: Colors.white,
              ),
              title: Text(
                "Sem III",
                style: TextStyle(
                  fontFamily: "Lora",
                  color: Colors.white,
                  fontSize: fntsz,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            ListTile(
              onTap: () {
                debugPrint("SEM IV");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sem4()));
                closeDrawer();
              },
              leading: Icon(
                Icons.article,
                color: Colors.white,
              ),
              title: Text(
                "Sem IV",
                style: TextStyle(
                  fontFamily: "Lora",
                  color: Colors.white,
                  fontSize: fntsz,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            ListTile(
              onTap: () {
                debugPrint("SEM V");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sem5()));
                closeDrawer();
              },
              leading: Icon(
                Icons.article,
                color: Colors.white,
              ),
              title: Text(
                "Sem V",
                style: TextStyle(
                  fontFamily: "Lora",
                  color: Colors.white,
                  fontSize: fntsz,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            ListTile(
              onTap: () {
                debugPrint("SEM VI");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sem6()));
                closeDrawer();
              },
              leading: Icon(
                Icons.article,
                color: Colors.white,
              ),
              title: Text(
                "Sem VI",
                style: TextStyle(
                  fontFamily: "Lora",
                  color: Colors.white,
                  fontSize: fntsz,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            ListTile(
              onTap: () {
                debugPrint("SEM VII");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sem7()));
                closeDrawer();
              },
              leading: Icon(
                Icons.article,
                color: Colors.white,
              ),
              title: Text(
                "Sem VII",
                style: TextStyle(
                  fontFamily: "Lora",
                  color: Colors.white,
                  fontSize: fntsz,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            ListTile(
              onTap: () {
                debugPrint("SEM VIII");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sem8()));
                closeDrawer();
              },
              leading: Icon(
                Icons.article,
                color: Colors.white,
              ),
              title: Text(
                "Sem VIII",
                style: TextStyle(
                  fontFamily: "Lora",
                  color: Colors.white,
                  fontSize: fntsz,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
