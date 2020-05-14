import 'package:LXGuide/login/login.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'theme.dart';
import 'package:LXGuide/login/login.dart';
import 'package:LXGuide/home/home.dart';

class AppDrawer extends StatelessWidget {
  @override
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
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()));
            },
          ),
          Divider(
            color: Color(0xFFf8777c),
            thickness: 1.0,
          ),
          _createDrawerItem(
              icon: Icons.language,
              text: 'Switch Language\n(coming soon...)',
              onTap: null),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Color(0xFFf8777c),
      ),
      accountName: Text("John Doe"), //accountName HERE!
      accountEmail: Text("john.doe123@mail.kmutt.ac.th"), //accountEmail HERE!!
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
