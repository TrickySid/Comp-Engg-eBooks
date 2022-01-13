import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:books_mini_project_ui/FirstScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var fntsz4;

class sem4 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

var dio = new Dio();

// /storage/emulated/0/Android/data/com.example.books_mini_project_2/files

class _MyAppState extends State<sem4> {
  Future<void> openFile(String lnk, String name, double sz) async {
    fntsz4 = MediaQuery.of(context).orientation == Orientation.landscape
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
                        "Semester 4 ",
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
              print("EMIV");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%204%2FADVANCED%20ENGINEERING%20MATHEMATICS%20BY%20ERWIN%20ERESZIG1.pdf?alt=media&token=beda293c-766a-448b-84c8-bd698c6c4e0e";
              openFile(lnk, "41", 10485760);
              setState(() {
                //isDownloaded[0] = true;
              });
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
                        'Engineering Mathematics IV ',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Erwin Kreyszig, “Advanced Engineering Mathematics”, John Wiley & Sons.',
                        style: TextStyle(
                            fontFamily: "Lora",
                            color: Colors.white.withOpacity(0.6)),
                      ),
                      // trailing: IconButton(
                      //   onPressed: () {
                      //     delFile("41");
                      //     setState(() {
                      //       //isDownloaded[0] = false;
                      //     });
                      //   },
                      //   icon: Icon(
                      //     Icons.delete,
                      //     key: Key('em4_del'),
                      //     color: isDownloaded[0]
                      //         ? Colors.white
                      //         : Color(0xff42447a),
                      //   ),
                      // )
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
              print("Analysis of Algorithms");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%204%2FIntroduction%20to%20Algorithms%2C%20Third%20Edition%20(%20PDFDrive%20).pdf?alt=media&token=452ded1b-e6c0-41fe-8172-f9ea7973f47a";
              openFile(lnk, "42", 5033164);
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
                        'Analysis of Algorithms',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'T. H. Cormen, “Introduction to algorithms”',
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
              print("python");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%204%2FBeginning%20Python%20Using%20Python%202.6%20and%20Python%203.1.pdf?alt=media&token=46ed9ae1-c243-40b7-9626-cf97ee7270fa";
              openFile(lnk, "43", 4194304);
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
                        'Python Programming',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Dr. R. Nageswara Rao, “Core Python Programming”, DreamtechPress',
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
              print("DBMS");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%204%2Fkorth.pdf?alt=media&token=4e1eb786-ae92-4128-9634-214ccbc91323";
              openFile(lnk, "44", 4194304);
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
                        'Database Management System',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Korth, Slberchatz,Sudarshan, Database System Concepts',
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
              print("OS");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%204%2FOperating%20System%20Concepts%20(%20PDFDrive%20).pdf?alt=media&token=901818ff-1db7-47f4-8eb2-dbfab489bf95";
              openFile(lnk, "45", 30408704);
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
                        'Operating System',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Abraham Silberschatz, Operating System Concepts',
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
              print("MP");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semster%204%2FUnderstanding%208085_8086%20Microprocessors%20and%20Peripheral%20ICs%20%20(%20PDFDrive%20).pdf?alt=media&token=250f1675-b01b-4569-98c3-3042ac9ef7d5";
              openFile(lnk, "46", 3774873);
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
                        'Microprocessor',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Understanding 8086,8086 Microprocessors',
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
class _MyAppState extends State<sem4> {
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
                    fontFamily: "Lora", color: Colors.white, fontSize: fntsz4),
              ),
              Text(
                "It will open after download gets completed",
                style: TextStyle(
                    fontFamily: "Lora", color: Colors.white, fontSize: fntsz4),
              ),
              Text(
                "Please do not quit app untill download completes!!",
                style: TextStyle(
                    fontFamily: "Lora", color: Colors.red, fontSize: fntsz4),
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
                    "Engineering Mathematics -IV",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("42");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Analysis of Algorithms",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("43");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Python programming",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("44");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Database Managemet Systems",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("45");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Operating Systems",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("46");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Microprocessor",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
