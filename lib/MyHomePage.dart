import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';
import 'FirstScreen.dart';
import 'CustomDrawer.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //start     this is for storage permission
  void initState() {
    getPer();
    super.initState();
  }

  Future<void> getPer() async {
    if (await Permission.storage.request().isGranted) {
      print("Already Granted \n\n\n");
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      print(statuses[Permission.storage]);
      print("success\n\n\n");
    }
  }
  //end     this is for storage permission

  FSBStatus drawerStatus;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SwipeDetector(
          onSwipeRight: () {
            setState(() {
              drawerStatus = FSBStatus.FSB_OPEN;
            });
          },
          onSwipeLeft: () {
            setState(() {
              drawerStatus = FSBStatus.FSB_CLOSE;
            });
          },
          child: FoldableSidebarBuilder(
            drawerBackgroundColor: Colors.white,
            drawer: CustomDrawer(
              closeDrawer: () {
                setState(() {
                  drawerStatus = FSBStatus.FSB_CLOSE;
                });
              },
            ),
            screenContents: FirstScreen(),
            status: drawerStatus,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                    ? FSBStatus.FSB_CLOSE
                    : FSBStatus.FSB_OPEN;
              });
            }),
      ),
    );
  }
}
