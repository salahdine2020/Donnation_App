import 'package:crudfirebaseapp/BouttomNavigation_Bar/Bouttom_Navigation_bar_user.dart';
import 'package:crudfirebaseapp/resources/assets.dart';
import 'package:crudfirebaseapp/resources/box_nm.dart';
import 'package:crudfirebaseapp/resources/text_styles.dart';
import 'package:crudfirebaseapp/widget/app_drawer.dart';
import 'package:crudfirebaseapp/widget/statecontaineruser.dart';
import 'package:crudfirebaseapp/widget/userinf.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  UserInformation event;
  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = StateContainerUser.of(context);
    event = myInheritedWidget.event;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Profile', style: TextStyle(color: Colors.white, fontSize: 24),),
      ),
      backgroundColor: mC,
      body: Stack(
        children: <Widget>[
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AvatarImage(
                      bloodchoise: Assets.menpic,
                    ),
                    SizedBox(height: 15),
                    event != null
                        ? Text(
                      '${event.name_user}',
                      style: nameStyle,
                    )
                        : Text("No Name"),

                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          SocialBox(
                            icon: Icons.cake,
                            definition:    event != null
                                ? Text(
                              '${event.age_user}',
                              style: nameStyle2,
                            )
                                : Text("No Age"),
                          ),
                          SizedBox(width: 15),
                          SocialBox(
                            icon: Icons.person,
                            definition: event != null
                                ? Text(
                              '${event.selectedsix_user}',
                              style: nameStyle2,
                            )
                                : Text("No Sex"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          SocialBox(
                            icon: Icons.healing,
                            definition:   event != null
                                ? Text(
                              '${event.selectedblood_user}',
                              style: nameStyle2,
                            )
                                : Text("No Blood"),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SocialBox(
                            icon: Icons.healing,
                            definition: Text('Donate...'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          SocialBox(
                            icon: Icons.location_on,
                            definition:   event != null
                                ? Text(
                              '${event.Location_user}',
                              style: nameStyle2,
                            )
                                : Text("No Location"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          SocialBox(
                            icon: Icons.phone,
                            definition:    event != null
                                ? Text(
                              '${event.phone_user}',
                              style: nameStyle2,
                            )
                                : Text("No Phone"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top:150,
            left:72 ,
            right: 12,

            child: Row(
              children: <Widget>[
                Text('This page need to Prepare Data...' , style: TextStyle(color: Colors.redAccent),),
                SizedBox(width: 15,),
                Icon(Icons.build , color: Colors.redAccent),
              ],
            ),

          ),

        ],
      ),
    );
  }
}

class SocialBox extends StatelessWidget {
  final IconData icon;
  final Text definition;

  const SocialBox({this.icon, this.definition});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: nMboxInvert,
        child: Row(
          children: <Widget>[
            //FaIcon(icon, color: Colors.pink.shade800, size: 20),
            SizedBox(width: 8),
            definition,
          ],
        ),
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  String bloodchoise;

  AvatarImage({this.bloodchoise});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(8),
      decoration: nMbox,
      child: Container(
        decoration: nMbox,
        padding: EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: bloodchoise == 'Male'
                  ? AssetImage(Assets.menpic)
                  : AssetImage(Assets.womenpic),
            ),
          ),
        ),
      ),
    );
  }
}
