import 'package:crudfirebaseapp/blogpages/article_blog_pages.dart';
import 'package:crudfirebaseapp/screen_center/Center_profile_screen.dart';
import 'package:crudfirebaseapp/screen_center/Request_center.dart';
import 'package:crudfirebaseapp/screen_center/User_donnate.dart';

import 'package:crudfirebaseapp/screens_user/CenterScreen.dart';
import 'package:crudfirebaseapp/screens_user/RequestScreen.dart';
import 'package:crudfirebaseapp/screens_user/UserHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BouttomBarDonner extends StatefulWidget {
  @override
  _BouttomBarDonnerState createState() => _BouttomBarDonnerState();
}

class _BouttomBarDonnerState extends State<BouttomBarDonner> {
  int currentIndex = 0;
  List listPages_user = List();

  Widget currentPage;
//  SharedPreferences logindata;
//  String username;
//
//  void initial() async {
//    logindata = await SharedPreferences.getInstance();
//    setState(() {
//      username = logindata.getString('username');
//    });
//  }

  @override
  void initState() {
    super.initState();

    listPages_user
      ..add(HomeScreen())
      ..add(RequestFromCenters())
      ..add(CenterScreen())
      ..add(BlogArticlePage());
    currentPage = HomeScreen();

  }

  void changePage(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex; // give current index
      currentPage = listPages_user[selectedIndex];// give the page related with current page

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: currentIndex == 0 ? Colors.redAccent : Colors.grey,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_active,
              color: currentIndex == 1 ? Colors.redAccent : Colors.grey,
            ),
            title: Text(
              'Requestes',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.healing,
              color: currentIndex == 2 ? Colors.redAccent : Colors.grey,
            ),
            title: Text(
              'Center',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mode_comment,
              color: currentIndex == 3 ? Colors.redAccent : Colors.grey,
            ),
            title: Text(
              'Blog',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
        onTap: (selectedIndex) => changePage(selectedIndex),
      ),
    );
  }
}
