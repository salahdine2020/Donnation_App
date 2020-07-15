import 'package:crudfirebaseapp/BouttomNavigation_Bar/Bouttom_Navigation_bar_center.dart';
import 'package:crudfirebaseapp/BouttomNavigation_Bar/Bouttom_Navigation_bar_user.dart';
import 'package:crudfirebaseapp/model/CrudFireFile.dart';
import 'package:crudfirebaseapp/resources/assets.dart';
import 'package:crudfirebaseapp/resources/colors.dart';
import 'package:crudfirebaseapp/screen_center/Center_Regestrscreen.dart';
import 'package:crudfirebaseapp/widget/statecontaineruser.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRegistration extends StatefulWidget {
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  //bool isClick = true ;
  CrudFire crud = new CrudFire();
  final formState = GlobalKey<FormState>();
  var selectedsix = 'Male';
  var selectedblood = 'A+';
  String sex, age, name, phone, Location;

  void updatseen(String des) async {
    // use in button case
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('seen', des);
  }

  submitEventDetails() {
    final myInheritedWidget = StateContainerUser.of(context);
    if (formState.currentState.validate()) {
      formState.currentState.save();
      crud.Creatuser({
        'name': name,
        'age': age,
        'sex': selectedsix,
        'rang': selectedblood,
        'phone': phone,
      });
      myInheritedWidget.updateEventInfoUser(
        sex_user: sex,
        age_user: age,
        name_user: name,
        phone_user: phone,
        Location_user: Location,
        selectedblood_user: selectedblood,
        selectedsix_user: selectedsix,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BouttomBarDonner(),
        ),
      );
    } else {
      print('Error in Validation');
    }
  }

//  SharedPreferences logindata;
//  bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

//  void check_if_already_login() async {
//    logindata = await SharedPreferences.getInstance();
//    newuser = (logindata.getBool('login') ?? true);
//    print(newuser);
//    if (newuser == false) {
//      Navigator.pushReplacement(
//        context,
//        new MaterialPageRoute(
//          builder: (context) => BouttomBarDonner(),
//        ),
//      );
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            Assets.Welecom1,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            // background filter to our picture .
            color: backcolor,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 28, bottom: 28),
            child: Card(
              color: Colors.white.withOpacity(0.9),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView(
                  children: <Widget>[
                    Form(
                      key: formState,
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  child: Container(
                                    height: 32,
                                    width: 100,
                                    color: cardcolor,
                                    child: Center(
                                      child: Text(
                                        'DONNER',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    // Navigator.pop(context);
                                    updatseen('user_reg');
                                  },
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 32,
                                    width: 100,
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'Centers',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    updatseen('center_reg');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MedicaleRigester(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.person),
                                      onPressed: null),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: 10,
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Name',
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Name Is Required';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) => name = value,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.cake), onPressed: null),
                                  Expanded(
                                      child: Container(
                                          margin: EdgeInsets.only(
                                            right: 10,
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: 'Age'),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Name Is Required';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) => age = value,
                                          )))
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: <Widget>[
                                DropdownButton<String>(
                                  value: selectedsix,
                                  items: [
                                    DropdownMenuItem(
                                        value: 'Male', child: Text('Male')),
                                    DropdownMenuItem(
                                        value: 'Female', child: Text('Female')),
                                    DropdownMenuItem(
                                        value: 'Other', child: Text('Other')),
                                  ],
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      selectedsix = v;
                                    });
                                  },
                                  isExpanded: false,
                                ),
                                SizedBox(width: 70),
                                DropdownButton<String>(
                                  value: selectedblood,
                                  items: [
                                    DropdownMenuItem(
                                        value: 'A+', child: Text('A+')),
                                    DropdownMenuItem(
                                        value: 'B+', child: Text('B+')),
                                    DropdownMenuItem(
                                        value: 'O+', child: Text('O+')),
                                    DropdownMenuItem(
                                        value: 'A-', child: Text('A-')),
                                    DropdownMenuItem(
                                        value: 'B-', child: Text('B-')),
                                    DropdownMenuItem(
                                        value: 'O-', child: Text('O-')),
                                    DropdownMenuItem(
                                        value: 'AB', child: Text('AB')),
                                  ],
                                  onChanged: (va) {
                                    print(va);
                                    setState(() {
                                      selectedblood = va;
                                    });
                                  },
                                  isExpanded: false,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.home), onPressed: null),
                                  Expanded(
                                      child: Container(
                                          margin: EdgeInsets.only(
                                            right: 10,
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: 'Adderrs'),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Name Is Required';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) =>
                                                Location = value,
                                          )))
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.phone), onPressed: null),
                                  Expanded(
                                      child: Container(
                                          margin: EdgeInsets.only(
                                            right: 10,
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: 'PhoneCall'),
                                            keyboardType: TextInputType.phone,
                                            //controller: passwordController,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Password Is Required';
                                              } else if (value.length < 10) {
                                                return 'the phone number is Incorrect';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) => phone = value,
                                          )))
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: 46,
                                  width: 200,
                                  child: RaisedButton(
                                    onPressed: () {
                                      submitEventDetails();
                                      //check_if_already_login();
                                      updatseen('user_prof');
                                    },
                                    color: cardcolor,
                                    child: Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // positionned ),
          ),
        ],
      ),
    );
  }
}
