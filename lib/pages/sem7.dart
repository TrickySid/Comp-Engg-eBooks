import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:books_mini_project_ui/FirstScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var fntsz7;

class sem7 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

var dio = new Dio();

// /storage/emulated/0/Android/data/com.example.books_mini_project_2/files

class _MyAppState extends State<sem7> {
  Future<void> openFile(String lnk, String name, double sz) async {
    fntsz7 = MediaQuery.of(context).orientation == Orientation.landscape
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
                        "Semester 7 ",
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
              print("Digital Signal & Image Processing");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%207%2FDigital_Image_Processing.pdf?alt=media&token=d03841e7-42c4-4e06-b734-76c5b79ff002";
              openFile(lnk, "71", 6501171);
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
                        'Digital Signal & Image Processing',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Rafel C. Gonzalez and Richard E. Woods,  ̳Digital Image Processing‘',
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
              print("Mobile Communication & Computing");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%207%2Ftutorial%5CMobile-Communications-JochenSchiller.pdf?alt=media&token=0469e665-c6e5-4e6b-9857-f6b0fff920d0";
              openFile(lnk, "72", 18874368);
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
                        'Mobile Communication & Computing',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Jochen Schilller,‖Mobile Communication ―, Addision wisely,Pearson Education',
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
              print("Artificial Intelligence & Soft Computing");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%207%2FAIMA-3rd-edition.pdf?alt=media&token=a1a586d0-f6e0-4cd8-baff-c25eb2dbafdb";
              openFile(lnk, "73", 20552089);
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
                        'Artificial Intelligence & Soft Computing',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Stuart J. Russell and Peter Norvig, "Artificial Intelligence A Modern Approach',
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
              print("Advanced System Security and Digital Forensics");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%207%2FComputer_Security_Principles_and_Practice_(3rd_Edition).pdf?alt=media&token=a008b85e-1c2c-4adf-bbd3-acd82827fa61";
              openFile(lnk, "74", 20552089);
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
                        'Advanced System Security and Digital Forensics',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Computer Security Principles and Practice, William Stallings',
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
              print("Big Data Analytics");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%207%2FMining%20Datasets.pdf?alt=media&token=6bf06039-97f5-4042-91ff-025694bc47aa";
              openFile(lnk, "75", 3460300);
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
                        'Big Data Analytics',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'CreAnand Rajaraman and Jeff Ullman ―Mining of Massive Datasets‖',
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
class _MyAppState extends State<sem7> {
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
                    fontFamily: "Lora", color: Colors.white, fontSize: fntsz7),
              ),
              Text(
                "It will open after download gets completed",
                style: TextStyle(
                    fontFamily: "Lora", color: Colors.white, fontSize: fntsz7),
              ),
              Text(
                "Please do not quit app untill download completes!!",
                style: TextStyle(
                    fontFamily: "Lora", color: Colors.red, fontSize: fntsz7),
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
                    delFile("71");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Digital Signal & Image Processing",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("72");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Mobile Communication & Computing",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("73");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Artificial Intelligence & Soft Computing",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("74");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Advanced System Security and Digital Forensics",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("75");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Big Data Analytics",
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
