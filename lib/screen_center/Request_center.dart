import 'package:crudfirebaseapp/BouttomNavigation_Bar/Bouttom_Navigation_bar_center.dart';
import 'package:crudfirebaseapp/model/CrudFireFile.dart';
import 'package:crudfirebaseapp/resources/text_styles.dart';
import 'package:crudfirebaseapp/widget/centerinf.dart';
import 'package:crudfirebaseapp/widget/statecontaineruser.dart';
import 'package:flutter/material.dart';

class RequestBlood extends StatefulWidget {
  @override
  _RequestBloodState createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {
  CenterInf event2;
  CrudFire crud = CrudFire();
  final formState3 = GlobalKey<FormState>();
  String name, donners, bloodrange, location;
  bool OpositiveVal = false;
  bool OnigativVal = false;
  bool ApositiveVal = false;
  bool AnigativeVal = false;
  bool BpositiveVal = false;
  bool BnigativeVal = false;
  bool ABVal = false;

  String Opositive = 'O+';
  String Onigativ = 'O-';
  String Apositive = 'A+';
  String Anigative = 'A-';
  String Bpositive = 'B+';
  String Bnigative = 'B-';
  String AB = 'AB';

  List<String> bloodselc_list = [];

  Widget checkbox(String title, bool boolValue) {
    // bloodselc.add(title);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          activeColor: Colors.redAccent,
          onChanged: (bool value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case 'O+':
                  OpositiveVal = value;
                  if (OpositiveVal) {
                    bloodselc_list.add(Onigativ);
                  }
                  break;
                case "O-":
                  OnigativVal = value;
                  if (OnigativVal) {
                    bloodselc_list.add(Opositive);
                  }
                  break;
                case "A+":
                  ApositiveVal = value;
                  if (ApositiveVal) {
                    bloodselc_list.add(Apositive);
                  }
                  break;
                case "A-":
                  AnigativeVal = value;
                  if (AnigativeVal) {
                    bloodselc_list.add(Anigative);
                  }
                  break;
                case "B+":
                  BpositiveVal = value;
                  if (BpositiveVal) {
                    bloodselc_list.add(Bnigative);
                  }
                  break;
                case "B-":
                  BnigativeVal = value;
                  if (BnigativeVal) {
                    bloodselc_list.add(Bnigative);
                  }
                  break;
                case "AB":
                  ABVal = value;
                  if (ABVal) {
                    bloodselc_list.add(AB);
                  }
                  break;
              }
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = StateContainerUser.of(context);
    event2 = myInheritedWidget.event2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Request',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(16),
          elevation: 16,
          child: Form(
            key: formState3,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'REQUESTES',
                    style: TextStyle(fontSize: 24 , color: Colors.redAccent),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.home , color: Colors.redAccent,), onPressed: null),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            child: event2 != null
                                ? Text(
                                    '${event2.center_name}',
                                    style: nameStyle,
                                  )
                                : Text("No Name"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.location_on , color: Colors.redAccent,), onPressed: null),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            child: event2 != null
                                ? Text(
                                    '${event2.center_Location}',
                                    style: nameStyle,
                                  )
                                : Text("No Location"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      checkbox(Opositive, OpositiveVal),
                      checkbox(Onigativ, OnigativVal),
                      checkbox(Apositive, ApositiveVal),
                      checkbox(Anigative, AnigativeVal),
                    ],
                  ),
                  SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      checkbox(Bpositive, BpositiveVal),
                      checkbox(Bnigative, BnigativeVal),
                      checkbox(AB, ABVal),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.healing , color: Colors.redAccent,), onPressed: null),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(hintText: 'Donners Need'),
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Name Is Required';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => donners = value,
                                )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RaisedButton(
                      color: Colors.redAccent,
                      child: Text('SEND'),
                      onPressed: () {
                        if (formState3.currentState.validate()) {
                          formState3.currentState.save();
                          crud.CreatRequeste({
                            'name': name,
                            'location': location,
                            'donners': donners,
                            'bloodrange': bloodselc_list.toString(),
                          });
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BouttomBarCenter(),
                            ));
                        print(bloodselc_list);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
