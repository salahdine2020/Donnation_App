import 'package:crudfirebaseapp/blogpages/article_blog_pages.dart';
import 'package:crudfirebaseapp/screen_center/Center_profile_screen.dart';
import 'package:crudfirebaseapp/screen_center/Request_center.dart';
import 'package:crudfirebaseapp/screen_center/User_donnate.dart';

import 'package:crudfirebaseapp/screens_user/CenterScreen.dart';
import 'package:crudfirebaseapp/screens_user/RequestScreen.dart';
import 'package:crudfirebaseapp/screens_user/UserHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BouttomBarCenter extends StatefulWidget {
  @override
  _BouttomBarCenterState createState() => _BouttomBarCenterState();
}

class _BouttomBarCenterState extends State<BouttomBarCenter> {
  int currentIndex = 0;

  List listPages_Centers = List();
  Widget currentPage;
//  SharedPreferences logindata;
//  String username;

//  void initial() async {
//    logindata = await SharedPreferences.getInstance();
//    setState(() {
//      username = logindata.getString('username');
//    });
//  }
  @override
  void initState() {

    super.initState();
//    initial();
    listPages_Centers
      ..add(CenterProfile())
      ..add(UserListDonnate());

    currentPage = CenterProfile();
  }

  void changePage(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex; // give current index
      currentPage = listPages_Centers[selectedIndex];
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          // Navigation rout to CenterScreen(),
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => RequestBlood(),
          ));
        },
        tooltip: 'Increment',
        child: Icon(Icons.description),
        elevation: 8.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.redAccent,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Profile',
              style: TextStyle(),
            ),
          ),

//          BottomNavigationBarItem(
//            icon: Icon(
//              Icons.speaker_notes,
//              color: currentIndex == 1 ? Colors.redAccent : Colors.grey,
//            ),
//            title: Text(
//              'Requestes',
//              style: TextStyle(color: currentIndex == 1 ? Colors.redAccent : Colors.grey,),
//            ),
//          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            title: Text(
              'Donner',
              style: TextStyle(),
            ),
          ),
        ],
        onTap: (selectedIndex) => changePage(selectedIndex),
      ),
    );
  }
}
