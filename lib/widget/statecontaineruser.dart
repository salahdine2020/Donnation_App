import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'centerinf.dart';
import 'userinf.dart';

class StateContainerUser extends StatefulWidget {
  final Widget child;
  final UserInformation event;

  StateContainerUser({@required this.child, this.event});

  static StateContainerUserState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(InheritedContainer)
            as InheritedContainer)
        .data;
  }

  StateContainerUserState createState() => StateContainerUserState();
}

class StateContainerUserState extends State<StateContainerUser> {
  UserInformation event;
  CenterInf event2;
  void updateEventInfoUser(
      {
      sex_user,
      age_user,
      name_user,
      phone_user,
      Location_user,
      selectedblood_user,
      selectedsix_user}) {
    if (event == null) {
      event = UserInformation(
          sex_user: sex_user,
          age_user: age_user,
          name_user: name_user,
          phone_user: phone_user,
          Location_user: Location_user,
          selectedblood_user: selectedblood_user,
          selectedsix_user: selectedsix_user);
      setState(() {
        event = event;
      });
    } else {
      setState(() {
        event.sex_user = sex_user ?? event.sex_user;
        event.age_user = age_user ?? event.age_user;
        event.name_user = name_user ?? event.name_user;
        event.phone_user = phone_user ?? event.phone_user;
        event.Location_user = Location_user ?? event.Location_user;
        event.selectedblood_user =
            selectedblood_user ?? event.selectedblood_user;
        event.selectedsix_user = selectedsix_user ?? event.selectedsix_user;
      });
    }
  }

  void updateEventInfoCenter(
      {
        center_email,
        center_name,
        center_phone,
        center_Location,
        center_specialty,
        center_selecthour,
        center_selectdaywork
      }) {
    if (event2 == null) {
      event2 = CenterInf(
      center_email: center_email,
      center_name : center_name,
      center_phone : center_phone,
      center_Location : center_Location,
      center_specialty : center_specialty,
      center_selecthour : center_selecthour,
      center_selectdaywork : center_selectdaywork,
      );
      setState(() {
        event = event;
      });
    } else {
      setState(() {
        event2.center_email = center_email ?? event2.center_email;
        event2.center_name = center_name ?? event2.center_name;
        event2.center_phone = center_phone ?? event2.center_phone;
        event2.center_Location = center_Location ?? event2.center_Location;
        event2.center_specialty = center_specialty ?? event2.center_specialty;
        event2.center_selecthour = center_selecthour ?? event2.center_selecthour;
        event2.center_selectdaywork = center_selectdaywork ?? event2.center_selectdaywork;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InheritedContainer(
      data: this,
      child: widget.child,
    );
  }
}

class InheritedContainer extends InheritedWidget {
  final StateContainerUserState data;

  InheritedContainer({Key key, @required this.data, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedContainer oldWidget) {
    return true;
  }
}
