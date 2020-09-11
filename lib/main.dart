import 'package:crudfirebaseapp/screen_center/Center_Regestrscreen.dart';
import 'package:crudfirebaseapp/screens_user/User_Registerscreen.dart';
import 'package:crudfirebaseapp/screens_user/UserHomeScreen.dart';
import 'package:crudfirebaseapp/widget/statecontaineruser.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BouttomNavigation_Bar/Bouttom_Navigation_bar_center.dart';
import 'BouttomNavigation_Bar/Bouttom_Navigation_bar_user.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String seen = prefs.getString('seen');
  Widget screen = UserRegistration();
  if (seen == null || seen == 'user_reg') {
    // seen = false;
    screen = UserRegistration();
  }else if ( seen == 'center_reg'){
    screen =  MedicaleRigester();
  }else if(seen == 'user_prof'){
    screen = BouttomBarDonner();
  }
  else if(seen == 'center_prof'){
    screen = BouttomBarCenter();
  }
  // return seen;
  runApp(
    StateContainerUser(
      child: LandingPage(screen: screen,),
    ),
  );
}

//Future<bool> CheekSennScreen() async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  String seen = prefs.getString('seen');
//  if (seen == null) {
//    // seen = false;
//  }
//  // return seen;
//}
//
void updatseen(String des) async {
  // use in button case
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('seen', des);
}

class LandingPage extends StatelessWidget {
  final Widget screen;
  LandingPage({this.screen});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Simple Animations',
      theme: ThemeData.fallback(),
      home: this.screen,
    );
  }
}

//class ActivityRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Simple Animations',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: HomeScreen(),
//    );
//  }
//}
