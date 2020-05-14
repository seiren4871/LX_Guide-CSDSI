import 'package:LXGuide/login/login.dart';
import 'package:LXGuide/login/login_with_id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'theme.dart';
import 'package:LXGuide/login/login_as_guest.dart';
import 'package:LXGuide/home/home.dart';
import 'package:LXGuide/singleton.dart';
import 'package:LXGuide/drawer.dart';

class AppDrawer extends StatefulWidget {
  @override
  AppDrawerState createState() => AppDrawerState();

}

class AppDrawerState extends State<AppDrawer> {
  void setLogoutState() {
    setState(() {
      loggedIn = false;
      appData.emailOrIdFromGuest = "";
      appData.studentIdOrName = "";
    });
  }
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage()));
            },
          ),
           Divider(
            color: Color(0xFFf8777c),
            thickness: 1.0,
          ),
          _createDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Exit',
            onTap: () {
              setLogoutState();
//              Navigator.of(context).pop();
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (BuildContext context) => LoginPage()));
              Navigator.popUntil(context,
                  ModalRoute.withName(
                      Navigator.defaultRouteName));
            },
          ),
          Divider(
            color: Color(0xFFf8777c),
            thickness: 1.0,
          ),
          _createDrawerItem(
              icon: Icons.language,
              text: 'Switch Language\n(coming soon...)',
              onTap: () {
//                setState(() {
//                  switchCount++;
////                 Firestore.instance.collection("guest").setDa
////                      .where("name", isEqualTo: appData.emailOrIdFromGuest).;
//                  print("switch Language Time = $switchCount");
//                });

              }),
        ],
      ),
    );
  }
  String under = appData.studentIdOrName.toUpperCase();
  String above = appData.emailOrIdFromGuest.toUpperCase();

  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Color(0xFFf8777c),
      ),
      accountName: Text("$above" ), //accountName HERE!
      accountEmail: Text( "$under" ), //accountEmail HERE!!
      currentAccountPicture: CircleAvatar(
        foregroundColor: Color(0xFF65bcbf),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.account_circle,
          size: 40.0,
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: Color(0xFFf8777c)),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}




