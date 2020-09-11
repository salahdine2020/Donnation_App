import 'package:crudfirebaseapp/model/CrudFireFile.dart';
import 'package:crudfirebaseapp/resources/assets.dart';
import 'package:crudfirebaseapp/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchCentersDelegateList extends StatefulWidget {
  @override
  _SearchCentersDelegateListState createState() =>
      _SearchCentersDelegateListState();
}

class _SearchCentersDelegateListState extends State<SearchCentersDelegateList> {
//  String dropdownValue = 'blood';
//
//  Widget DropDownButtonuse() {
//    return DropdownButton<String>(
//      value: dropdownValue,
//      icon: Icon(
//        Icons.arrow_drop_down,
//        color: Colors.redAccent,
//      ),
//      iconSize: 24,
//      elevation: 16,
//      style: TextStyle(color: Colors.redAccent),
//      underline: Container(
//        height: 2,
//        color: Colors.redAccent,
//      ),
//      onChanged: (String newValue) {
//        setState(() {
//          dropdownValue = newValue;
//          // so dropdownValue store each time the new value ...
//        });
//      },
//      items: <String>['blood', 'sex']
//          .map<DropdownMenuItem<String>>((String choicegroupe) {
//        return DropdownMenuItem<String>(
//          value: choicegroupe,
//          child: Text(choicegroupe),
//        );
//      }).toList(),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Choice'),
        actions: <Widget>[
          //DropDownButtonuse(),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearchRequestFire(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DataSearchRequestFire extends SearchDelegate<String> {
  String donnerschoice;
  CrudFire crud = CrudFire();

  DataSearchRequestFire({
    this.donnerschoice,
  });

  //SearchDelegateList srch = SearchDelegateList();
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildStreamBuilder();
  }

  StreamBuilder<QuerySnapshot> buildStreamBuilder() {
    return StreamBuilder(
      stream: crud.RequestColl.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');

        final bloodearch = snapshot.data.documents.where((DocumentSnapshot a) =>
            a.data['bloodrange'].toString().contains(query));
        final locationsearch = snapshot.data.documents.where(
            (DocumentSnapshot a) =>
                a.data['location'].toString().contains(query));

        var wid1 = donnerschoice == 'bloodrange' ? bloodearch : locationsearch;

        var res = wid1
            .map<Widget>(
              (a) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          a.data['location'].toString(),
                          style: nameStyle,
                        ),
                        subtitle: Text(
                          a.data['bloodrange'].toString(),
                        ),
                        leading: CircleAvatar(
                          child: Image.asset(
                            Assets.blood_request,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList();
        return ListView(
          children: res,
        );
      },
    );
  }
}
