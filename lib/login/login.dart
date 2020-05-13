import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lx_building/login/login_as_guest.dart';
import 'package:lx_building/login/login_with_id.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover)
        ),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 200.0,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Contact us",
                      style: new TextStyle(
                          color: lButtonColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

