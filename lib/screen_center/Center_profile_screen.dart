import 'package:crudfirebaseapp/resources/assets.dart';
import 'package:crudfirebaseapp/resources/text_styles.dart';
import 'package:crudfirebaseapp/widget/app_drawer.dart';
import 'package:crudfirebaseapp/widget/centerinf.dart';
import 'package:crudfirebaseapp/widget/statecontaineruser.dart';
import 'package:flutter/material.dart';

class CenterProfile extends StatefulWidget {
  @override
  CenterProfileState createState() => CenterProfileState();
}

class CenterProfileState extends State<CenterProfile> {
  CenterInf event2;
  var color = Colors.redAccent.withOpacity(0.3);
  var height = 1.0;
  var width = 1.0;

  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = StateContainerUser.of(context);
    event2 = myInheritedWidget.event2;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Profile', style: TextStyle(color: Colors.white, fontSize: 24),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    child: Image.asset(Assets.cliniquepic, height: 100),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 180,
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 24,
                        ),
                        event2 != null
                            ? Text(
                                '${event2.center_name}',
                                style: nameStyle,
                              )
                            : Text("No Name"),
                        event2 != null
                            ? Text(
                                '${event2.center_specialty}',
                                style: nameStyle2,
                              )
                            : Text("No Speciality"),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.email),
                                    onPressed: () {
                                      color = Colors.redAccent.withOpacity(0.3);
                                      height = 32;
                                      width = 132;
                                      setState(() {});
                                    }),
                                AnimatedContainer(
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  duration: Duration(seconds: 1),
                                  height: height,
                                  width: width,
                                  //color: Colors.redAccent,
                                  child: Center(
                                    child: Container(
                                      child: event2 != null
                                          ? Text(
                                              '${event2.center_email}',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : Text("No Email"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.phone),
                                    onPressed: () {
                                      color = Colors.redAccent.withOpacity(0.5);
                                      height = 32;
                                      width = 132;
                                      setState(() {});
                                    }),
                                AnimatedContainer(
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  duration: Duration(seconds: 1),
                                  height: height,
                                  width: width,
                                 // color: Colors.redAccent,
                                  child: Center(
                                    child: Container(
                                      child: event2 != null
                                          ? Text(
                                              '${event2.center_phone}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : Text("No Phone"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "About",
                style: nameStyle,
              ),
              SizedBox(
                height: 16,
              ),
              event2 != null
                  ? Text(
                      '${event2.center_selecthour}',
                      style: nameStyle2,
                    )
                  : Text("No Hour Selected"),
              SizedBox(
                height: 4,
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //Image.asset("assets/mappin.png"),

                          Icon(Icons.location_on),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Address",
                                style: nameStyle,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                width: 100,
                                child: event2 != null
                                    ? Text(
                                        '${event2.center_Location}',
                                        style: nameStyle2,
                                      )
                                    : Text("No Location Specifiy"),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          //Image.asset("assets/clock.png"),
                          Icon(Icons.access_time),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Daily Practict",
                                style: nameStyle,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                width: 100,
                                child: event2 != null
                                    ? Text(
                                        '${event2.center_selectdaywork}',
                                        style: nameStyle,
                                      )
                                    : Text("No DayWork Select.."),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 155,
                        height: 155,
                        child: Image.asset(
                          Assets.mappic,
                          width: 180,
                        ),
                      ),
                      Positioned(
                          left: 80,
                          top: 50,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.redAccent,
                            size: 32,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}
