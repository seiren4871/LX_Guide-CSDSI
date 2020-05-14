import 'package:LXGuide/informationPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:LXGuide/contact.dart';
import 'package:LXGuide/drawer.dart';
import 'package:LXGuide/SearchRoomPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffece3e2),
      bottomNavigationBar: bottomNavigation(context),
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFFf8777c),
        title: Text("Home"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: Image.asset(
                      "assets/img/logo.png",
                      height: 83.0,
                      width: 141.5,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  child: Image.asset(
                    "assets/img/LXBuilding.png",
                    height: 132,
                    width: 230.5,
                    fit: BoxFit.fill,
                  ),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(.6)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InformationPage(),
                        ));
                  },
                  child: Container(
                    height: 50.0,
                    width: 250.0,
                    margin: EdgeInsets.all(10.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    alignment: FractionalOffset.center,
                    decoration: new BoxDecoration(
                      color: Color(0xFF65bcbf),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(30.0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText(
                          "ABOUT LX BUILDING",
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF0d1b46),
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchRoom(),
                        ));
                  },
                  child: Container(
                    height: 50.0,
                    width: 250.0,
                    margin: EdgeInsets.all(10.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    alignment: FractionalOffset.center,
                    decoration: new BoxDecoration(
                      color: Color(0xFF65bcbf),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(30.0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText(
                          "NAVIGATE",
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF0d1b46),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        ClipOval(
                          child: Material(
                            color: Colors.white70, // button color
                            child: InkWell(
                              splashColor: Colors.white70, // inkwell color
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Icon(Icons.location_on)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SearchRoom(),
                                    ));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
        leading: Container(
          child: SizedBox(
            width: 35,
            height: 35,
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.all(2),
              color: Color(0xFF65bcbf),
              shape: CircleBorder(),
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: Color(0xFF0d1b46),
              ),
            ),
          ),
        ),
        trailing: Container(
          child: SizedBox(
            child: FlatButton(
              // padding: EdgeInsets.all(1),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUs(),
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
