import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lx_building/home/navigate.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import '../colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFece5e3),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0XFFee6277),
            size: 35.0,
          ),
          onPressed: () {},
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 80.0,
                      width: 150.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Image.asset(
                    "assets/images/lx_building.png",
                    height: 240.0,
                    width: 240,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AutoSizeText(
                  "About LX Building",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 19.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 40.0,
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: 50.0,
                    width: 220.0,
                    margin: EdgeInsets.all(10.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    alignment: FractionalOffset.center,
                    decoration: new BoxDecoration(
                      color: lButtonColor,
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
                              color: Colors.black54,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(width: 15.0,),
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
                                Navigator.of(context).pop();
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: lButtonColor, // button color
                        child: InkWell(
                          splashColor: Colors.white, // inkwell color
                          child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.arrow_back_ios)),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
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
