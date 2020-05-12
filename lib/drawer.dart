import 'package:flutter/material.dart';
import 'main.dart';
import 'theme.dart';

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
                  builder: (BuildContext context) => MyApp()));
            },
          ),
          Divider(),
          _createDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Log out',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyApp()));
            },
          ),
          Divider(),
          _createDrawerItem(
            icon: Icons.language,
            text: 'Switch Language',
            onTap: null,
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text("John Doe"),
      accountEmail: Text("john.doe123@mail.kmutt.ac.th"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          "J",
          style: TextStyle(fontSize: 40.0),
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