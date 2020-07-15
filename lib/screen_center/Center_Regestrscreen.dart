import 'package:crudfirebaseapp/BouttomNavigation_Bar/Bouttom_Navigation_bar_center.dart';
import 'package:crudfirebaseapp/BouttomNavigation_Bar/Bouttom_Navigation_bar_user.dart';
import 'package:crudfirebaseapp/model/CrudFireFile.dart';
import 'package:crudfirebaseapp/resources/assets.dart';
import 'package:crudfirebaseapp/resources/colors.dart';
import 'package:crudfirebaseapp/screens_user/User_Registerscreen.dart';
import 'package:crudfirebaseapp/widget/statecontaineruser.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicaleRigester extends StatefulWidget {
  @override
  _MedicaleRigesterState createState() => _MedicaleRigesterState();
}

class _MedicaleRigesterState extends State<MedicaleRigester> {
  CrudFire crud = new CrudFire();
  final formState2 = GlobalKey<FormState>();
  String email, name, phone, Location, specialty;
  String selecthour = '24/24 H';

  String selectdaywork = 'All Day';

  void updatseen(String des) async {
    // use in button case
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('seen', des);
  }

  submitforCenter() {
    final myInheritedWidget = StateContainerUser.of(context);
    if (formState2.currentState.validate()) {
      formState2.currentState.save();
      crud.Creatcenter({
        'name': name,
        'speciality': specialty,
        'Email': email,
        'Adrress': Location,
        'phone': phone,
        'hourwork': selecthour,
        'daywork': selectdaywork,
      });
      myInheritedWidget.updateEventInfoCenter(
        center_email: email,
        center_name: name,
        center_phone: phone,
        center_Location: Location,
        center_specialty: specialty,
        center_selecthour: selecthour,
        center_selectdaywork: selectdaywork,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BouttomBarCenter(),
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
    //check_if_already_login();
  }

//  void check_if_already_login() async {
//    logindata = await SharedPreferences.getInstance();
//    newuser = (logindata.getBool('login') ?? true);
//    print(newuser);
//    if (newuser == true) {
//       Navigator.pushReplacement(
//        context,
//         MaterialPageRoute(
//          builder: (context) => BouttomBarCenter(),
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
                      key: formState2,
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
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'DONNER',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    // Navigator.pop(context);
                                    updatseen('user_reg');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserRegistration(),
                                      ),
                                    );
                                  },
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 32,
                                    width: 100,
                                    color: cardcolor,
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
                                      icon: Icon(Icons.home), onPressed: null),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: 10,
                                      ),
                                      child: TextFormField(
                                        decoration:
                                            InputDecoration(hintText: 'Name'),
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
                                      icon: Icon(Icons.healing),
                                      onPressed: null),
                                  Expanded(
                                      child: Container(
                                          margin: EdgeInsets.only(
                                            right: 10,
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: 'Speciality'),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Name Is Required';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) =>
                                                specialty = value,
                                          )))
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 16,
                                ),
                                DropdownButton<String>(
                                  value: selecthour,
                                  items: [
                                    DropdownMenuItem(
                                        value: '24/24 H',
                                        child: Text('24/24 H')),
                                    DropdownMenuItem(
                                        value: '12/24 H',
                                        child: Text('12/24 H')),
                                    DropdownMenuItem(
                                        value: '7/24 H', child: Text('7/24 H')),
                                  ],
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      selecthour = v;
                                    });
                                  },
                                  isExpanded: false,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                DropdownButton<String>(
                                  value: selectdaywork,
                                  items: [
                                    DropdownMenuItem(
                                        value: 'All Day',
                                        child: Text(
                                          'All Day',
                                          style: TextStyle(fontSize: 12),
                                        )),
                                    DropdownMenuItem(
                                        value: 'All Day No WeekEnd',
                                        child: Text(
                                          'All Day No WeekEnd',
                                          style: TextStyle(fontSize: 12),
                                        )),
                                  ],
                                  onChanged: (v) {
                                    print(v);
                                    setState(() {
                                      selectdaywork = v;
                                    });
                                  },
                                  isExpanded: false,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.location_on),
                                      onPressed: null),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: 10,
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'ADRRESS'),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Name Is Required';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) => Location = value,
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
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.mail), onPressed: null),
                                  Expanded(
                                      child: Container(
                                          margin: EdgeInsets.only(
                                            right: 10,
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: 'Email'),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Name Is Required';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) => email = value,
                                          )))
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: 46,
                                  width: 200,
                                  child: RaisedButton(
                                    onPressed: () {
                                      submitforCenter();
                                      //check_if_already_login();
                                      updatseen('center_prof');
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
          ),
        ],
      ),
    );
  }
}
