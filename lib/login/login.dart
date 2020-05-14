import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:LXGuide/login/login_as_guest.dart';
import 'package:LXGuide/login/login_with_id.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:LXGuide/contactNoLogin.dart';

import '../colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      bottomNavigationBar: bottomNavigation(context),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover)
        ),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 80.0),
                    child: Image.asset(
                      "assets/img/logo.png",
                      scale: 1.0,
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginWithIdPage()),
                    );
                  },
                  child: Container(
                    height: 60.0,
                    width: 250.0,
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    alignment: FractionalOffset.center,
                    decoration: new BoxDecoration(
                      color: lButtonColor,
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(30.0)),
                    ),
                    child: AutoSizeText(
                      "STUDENT/STAFF",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26.0, color:  Colors.black54, fontWeight:  FontWeight.w900),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Explore as ",
                      style: new TextStyle(
                          color: Colors.black87,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w300),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginAsGuestPage()),
                        );
                      },
                      child: Text(
                        "Guest",
                        style: new TextStyle(
                            color: Colors.black87,
                            decoration: TextDecoration.underline,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottomNavigation(BuildContext context) {
  return BottomAppBar(
    // alignment: Alignment.bottomCenter,
    color: Color(0xFF384861),
    child: Container(
      child: ListTile(
        trailing: Container(
          child: SizedBox(
            child: FlatButton(
              // padding: EdgeInsets.all(1),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUsNoLogin(),
                    ));
              },
              child: RichText(
                text: TextSpan(
                  text: "Contact Us",
                  style: TextStyle(color: Color(0xFF65bcbf)),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

