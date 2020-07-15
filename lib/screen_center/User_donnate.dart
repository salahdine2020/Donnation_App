import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudfirebaseapp/model/CrudFireFile.dart';
import 'package:crudfirebaseapp/model/Search_Centers_FireStore.dart';
import 'package:crudfirebaseapp/model/Search_donner_Firestore.dart';
import 'package:crudfirebaseapp/resources/assets.dart';
import 'package:crudfirebaseapp/resources/text_styles.dart';
import 'package:flutter/material.dart';

class UserListDonnate extends StatefulWidget {
  @override
  _UserListDonnateState createState() => _UserListDonnateState();
}

class _UserListDonnateState extends State<UserListDonnate> {
  CrudFire crud = CrudFire();
  String dropdownValue = 'blood';
  Widget DropDownButtonuse() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
      iconSize: 22,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          // so dropdownValue store each time the new value ...
        });
      },
      items: <String>[
        'blood',
        'sex',
      ].map<DropdownMenuItem<String>>((String choicegroupe) {
        return DropdownMenuItem<String>(
          value: choicegroupe,
          child: Text(choicegroupe),
        );
      }).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: crud.DonnerList.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return Center(child: CircularProgressIndicator(backgroundColor: Colors.redAccent,));
          default:
            return  Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                actions: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      DropDownButtonuse(),
                      SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          showSearch(
                              context: context,
                              delegate: DataSearchDonnerFire(
                                donnerschoice: dropdownValue,
                              ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
              body: Stack(
                children: <Widget>[
                  ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return new Container(
                        height: 100,
                        width: 100,
                        child: Card(
                          color: Colors.redAccent.withOpacity(0.7),
                          child: Stack(
                            children: <Widget>[
                              ListTile(
                                title: new Text(
                                  document['name'],
                                  style: nameStyle2,
                                ),
                                subtitle: new Text(
                                  document['phone'],
                                  style: descriptionStyle,
                                ),
                                leading: CircleAvatar(
                                  radius: 20,
                                  //backgroundColor: Colors.redAccent.withOpacity(0.5),
                                  child: Image.asset(
                                    Assets.womenpic,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 240,
                                child: Container(
                                  width: 100,
                                  height: MediaQuery.of(context).size.height,
                                  color: Colors.white.withOpacity(0.5),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Spacer(),
                                          Text(document['rang']), // document['hourwork']
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Icon(Icons.healing),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(),
                                      Text('Location'),// document['daywork'] // try to use actuale location with GPS
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
