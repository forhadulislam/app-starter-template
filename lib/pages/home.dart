import 'package:flutter/cupertino.dart';
import 'package:app_starter_template/pages/feed.dart';
import 'package:app_starter_template/pages/profile.dart';
import 'package:app_starter_template/pages/notifications.dart';
import 'package:app_starter_template/pages/work.dart';
import 'package:app_starter_template/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:app_starter_template/widgets/header.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    print(pageIndex);
    pageController.jumpToPage(
      pageIndex,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Scaffold buildHomeScreen() {
    return Scaffold(
      appBar: header(context),
      body: PageView(
        children: <Widget>[
          Feed(),
          Notifications(),
          Work(),
          Search(),
          Profile()
        ],
        controller: this.pageController,
        onPageChanged: onPageChanged,
        physics: AlwaysScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: this.pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            title: Text("Notifications"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Work"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text("More"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildHomeScreen();
  }
}
