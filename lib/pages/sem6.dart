import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:books_mini_project_ui/FirstScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var fntsz6;

class sem6 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

var dio = new Dio();

// /storage/emulated/0/Android/data/com.example.books_mini_project_2/files

class _MyAppState extends State<sem6> {
  Future<void> openFile(String lnk, String name, double sz) async {
    fntsz6 = MediaQuery.of(context).orientation == Orientation.landscape
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
                        "Semester 6 ",
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
              print("Software Engineering");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semester6%2Fsoftware-engineering-practitioner_s-approach.pdf?alt=media&token=9c9f1a90-1e92-4e72-9092-fb9f23547730";
              openFile(lnk, "61", 9961472);
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
                        'Software Engineering',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Roger S. Pressman',
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
              print("SPCC");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semester6%2Fcompiler-ulman.pdf?alt=media&token=7b18a83b-4d81-4775-8231-aad7c941f8ed";
              openFile(lnk, "62", 4718592);
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
                        'System Programming & Compiler Construction',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Compilers -Alfred V. Aho, Ravi Sethi',
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
              print("Data Warehousing & Mining");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semester6%2Fdata_mining_concepts_and_techniques.pdf?alt=media&token=c7f46ba0-9503-4bae-858d-9c83569c1f25";
              openFile(lnk, "63", 5242880);
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
                        'Data Warehousing & Mining',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Data Warehousing & Mining -Jiawei Han',
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
              print("Cryptography & System Security");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semester6%2FCryptography%20and%20Network%20Security%20-%20Prins%20and%20Pract.%205th%20ed%20-%20W.%20Stallings%20(Pearson%2C%202011)%20BBSbb.pdf?alt=media&token=1cdc3f92-aaae-4cd8-b3fe-71d661a779ae";
              openFile(lnk, "64", 7864320);
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
                        'Cryptography & System Security',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Cryptography & System Security- William Stallings',
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
              print("Machine Learning");
              var lnk =
                  "https://firebasestorage.googleapis.com/v0/b/booksapp-628fb.appspot.com/o/Semester6%2Fintro-to-ml.pdf?alt=media&token=7b40ee15-274c-417c-a83c-b98886051976";
              openFile(lnk, "65", 3355443);
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
                        'Machine Learning ',
                        style:
                            TextStyle(fontFamily: "Lora", color: Colors.white),
                      ),
                      subtitle: Text(
                        'Introduction to Machine Learning -Ethem Alpaydın',
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
                    fontFamily: "Lora", color: Colors.white, fontSize: fntsz6),
              ),
              Text(
                "It will open after download gets completed",
                style: TextStyle(
                    fontFamily: "Lora", color: Colors.white, fontSize: fntsz6),
              ),
              Text(
                "Please do not quit app untill download completes!!",
                style: TextStyle(
                    fontFamily: "Lora", color: Colors.red, fontSize: fntsz6),
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
                    delFile("61");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Software Engineering",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("62");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "System Programming & Compiler Construction",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("63");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Data Warehousing & Mining",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("64");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Cryptography & System Security",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xffea3c53).withOpacity(0.8),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    delFile("65");
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Machine Learning ",
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
