import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:books_mini_project_ui/FirstScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var fntsz2;

class sem2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

var dio = new Dio();

// /storage/emulated/0/Android/data/com.example.books_mini_project_2/files

class _MyAppState extends State<sem2> {
  Future<void> openFile(String lnk, String name, double sz) async {
    fntsz2 = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height * 0.024
        : MediaQuery.of(context).size.width * 0.024;
    var dir = await getExternalStorageDirectory();
    print(dir.path);
    final filePath = ('${dir.path}' + '/$name.pdf');
    //these are the new changes
    var fl;
    var bytes;
    try {
      fl = File(filePath);
    } catch (e) {
      print(e);
    }
    //print("file size is ${await fl.length()} bytes");
    try {
      bytes = await fl.length();
    } catch (e) {
      print(e);
      bytes = 0.0;
    }

    if (bytes < sz) {
      print("downloading new the file ,please wait...");
      Navigator.push(context, MaterialPageRoute(builder: (context) => load()));
      await dio.download(lnk, filePath);
      Navigator.of(context).pop();
      openFile(lnk, name, sz);
    }
    print("file size is $bytes bytes");

    //for cant open file bug
    final result = await OpenFile.open(filePath);
    if (result.type.toString() == "ResultType.fileNotFound") {
      print("downloading the file ,please wait...");
      Navigator.push(context, MaterialPageRoute(builder: (context) => load()));
      await dio.download(lnk, filePath);
      Navigator.of(context).pop();
      openFile(lnk, name, sz);
    }
    // setState(() {
    //   _openResult = "type=${result.type}  message=${result.message}";
    // });
  }

  @override
  Widget build(BuildContext context) {
    var em4Pressed = false;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffce5b78), Colors.blueGrey[600]],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(70),
                    child: ListTile(
                      leading: Image.asset('assets/CEB_Logo.png'),
                      title: Text(
                        "Semester 2 ",
                        style: TextStyle(
                            fontFamily: "Lora",
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
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
          InkWell(
            onTap: () {
              print("Engineering Mathematics-II");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%204%2FADVANCED%20ENGINEERING%20MATHEMATICS%20BY%20ERWIN%20ERESZIG1.pdf?alt=media&token=beda293c-766a-448b-84c8-bd698c6c4e0e";
              openFile(lnk, "41", 10485760);
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              margin: EdgeInsets.all(10),
              color: Color(0xff42447a),
              //Colors.blueGrey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.article,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Engineering Mathematics-II',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Erwin Kreyszig, “Advanced Engineering Mathematics”, John Wiley & Sons',
                        style: TextStyle(
                            fontFamily: "Lora",
                            color: Colors.white.withOpacity(0.6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              print("Engineering Physics-II");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/semester%201%2Fbeiser-conceptsofmodernphysics.pdf?alt=media&token=97ca5214-7897-4e6d-9d36-dad9f2c5d640";
              openFile(lnk, "12", 21600665);
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              margin: EdgeInsets.all(10),
              color: //Color(0xff42447a)
                  Color(0xff42447a),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.article,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Engineering Physics-II',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Concepts of Modern Physics- ArtherBeiser',
                        style: TextStyle(
                            fontFamily: "Lora",
                            color: Colors.white.withOpacity(0.6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              print("Engineering Chemistry-II");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/semester%201%2Fengineeringchemistry.pdf?alt=media&token=fadcd837-6d95-48c9-92a2-70438198d723";
              openFile(lnk, "13", 13212057);
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              margin: EdgeInsets.all(10),
              color: //Color(0xff42447a)
                  Color(0xff42447a),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.article,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Engineering Chemistry-II',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Engineering Chemistry - Jain & Jain',
                        style: TextStyle(
                            fontFamily: "Lora",
                            color: Colors.white.withOpacity(0.6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              print("Engineering Graphics");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/semester%201%2Ftextbook-of-engineering-drawing.pdf?alt=media&token=fabb5fdc-3fab-42b7-a9ec-f60d7afdb4be";
              openFile(lnk, "24", 17511219);
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              margin: EdgeInsets.all(10),
              color: //Color(0xff42447a)
                  Color(0xff42447a),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.article,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Engineering Graphics',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Engineering Drawing by V. Venkata Reddy',
                        style: TextStyle(
                            fontFamily: "Lora",
                            color: Colors.white.withOpacity(0.6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              print("C programming");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/semester%201%2Fletusc.pdf?alt=media&token=41e3e277-3186-425c-8fef-b3b349fc8aab";
              openFile(lnk, "25", 4089446);
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              margin: EdgeInsets.all(10),
              color: //Color(0xff42447a)
                  Color(0xff42447a),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.article,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'C programming',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Let us C - Yashavant P. Kanetkar',
                        style: TextStyle(
                            fontFamily: "Lora",
                            color: Colors.white.withOpacity(0.6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Del()));
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              margin: EdgeInsets.all(10),
              color: //Color(0xff42447a)
                  Color(0xffea3c53).withOpacity(0.8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Delete Books',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

delFile(String s) async {
  var dir = await getExternalStorageDirectory();
  print(dir.path);
  final filePath = ('${dir.path}' + '/$s.pdf');
  var dfile = File(filePath);
  dfile.delete();
}
// Column(children: [
//   SizedBox(
//     height: 25,
//   ),
//
// ]),
// SizedBox(
//   width: 20,
// ),
// Column(
//   children: [
//     FittedBox(
//       child: Text(
//         "E. Mathematics-IV ",
//         style: TextStyle(
//                               fontFamily: "Lora",
//           color: Colors.white,
//           //fontWeight: FontWeight.w700
//         ),
//       ),
//     ),
//   ],
// ),

/*
class _MyAppState extends State<sem2> {
  final double _borderRadius = 24.0;
  bool show = false;
  Future<void> openFile() async {
    var dir = await getExternalStorageDirectory();
    print(dir.path);
    final filePath = ('${dir.path}' + '/3.pdf');
    final result = await OpenFile.open(filePath);
    if (result.type.toString() == "ResultType.fileNotFound") {
      print("downloading the file ,please wait...");
      await dio.download(
        "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/(Data%20Warehousing%20and%20Mining)The-Morgan-Kaufmann-Series-in-Data-Management-Systems-Jiawei-Han-Micheline-Kamber-Jian-Pei-Data-Mining.-Concepts-and-Techniques-3rd-Edition-Morgan-Kaufmann-2011.pdf?alt=media&token=fb117284-c0ca-48d2-8eda-b6ad74ba0332",
        filePath,
        onReceiveProgress: (count, total) {
          setState(() {
            show = true;
          });
        },
      );
      setState(() {
        show = false;
      });
      openFile();
    }
    // setState(() {
    //   _openResult = "type=${result.type}  message=${result.message}";
    // });
  }
*/
class load extends StatefulWidget {
  @override
  _loadState createState() => _loadState();
}

class _loadState extends State<load> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      backgroundColor: Color(0xff42447a),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitRotatingCircle(
                color: Colors.white,
                size: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Downloading file,Please wait...",
                style: TextStyle(
                    fontFamily: "Lora", color: Colors.white, fontSize: fntsz2),
              ),
              Text(
                "It will open after download gets completed",
                style: TextStyle(
                    fontFamily: "Lora", color: Colors.white, fontSize: fntsz2),
              ),
              Text(
                "Please do not quit app untill download completes!!",
                style: TextStyle(
                    fontFamily: "Lora", color: Colors.red, fontSize: fntsz2),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Del extends StatefulWidget {
  @override
  _DelState createState() => _DelState();
}

class _DelState extends State<Del> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff42447a),
          leading: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          title: Text("Delete Books",
              style: TextStyle(
                color: Colors.white,
              ))),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    delFile("41");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Engineering Mathematics-II",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("12");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Engineering Physics-II",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("13");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Engineering Chemistry-II",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("24");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Engineering Graphics",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("25");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "C programming",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
