import 'package:app_starter_template/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String myPath;

  Future<String> getPath() async{
    final appDocDir = await path_provider.getApplicationDocumentsDirectory();
    myPath = appDocDir.path;
    print(myPath);
  }

  @override
  void initState() {
    super.initState();
    getPath();
  }


  @override
  Widget build(context) {
    getPath();
    return Scaffold(
      body: Text("This is another Timelines and nothing happened $myPath"),
    );
  }
}
