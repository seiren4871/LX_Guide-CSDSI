import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';

class LoginWithIdPage extends StatefulWidget {
  @override
  _LoginWithIdPageState createState() => _LoginWithIdPageState();
}

class _LoginWithIdPageState extends State<LoginWithIdPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  TextStyle editTextStyle =
      TextStyle(color: kTextBlack.withOpacity(0.8), fontSize: 16.0);

  TextStyle editTextHintStyle =
      TextStyle(color: kTextBlack.withOpacity(0.4), fontSize: 16.0);

  OutlineInputBorder txtBorder = OutlineInputBorder(
    borderSide: BorderSide(color: lButtonColor.withOpacity(0.1)),
    borderRadius: BorderRadius.circular(5.0),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Image.asset(
                        "assets/images/login_with_id.png",
                        height: 100.0,
                        width: 250.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        padding: EdgeInsets.all(20.0),
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          color: Colors.white70,
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(30.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "KMUTT email",
                              textDirection: TextDirection.ltr,
                              style: new TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            TextFormField(
                              controller: _emailController,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                //_doApiCall();
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: lButtonColor.withOpacity(0.1),
                                focusColor: lButtonColor.withOpacity(0.1),
                                hoverColor: lButtonColor.withOpacity(0.1),
                                border: txtBorder,
                                focusedBorder: txtBorder,
                                enabledBorder: txtBorder,
                                disabledBorder: txtBorder,
                                contentPadding: EdgeInsets.all(10),
                                hintText: "XXXXX@mail.kmutt.ac.th",
                                hintStyle: editTextHintStyle,
                              ),
                              style: editTextStyle,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Password",
                              textDirection: TextDirection.ltr,
                              style: new TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.visiblePassword,
                              onFieldSubmitted: (value) {
                                //_doApiCall();
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: lButtonColor.withOpacity(0.1),
                                focusColor: lButtonColor.withOpacity(0.1),
                                hoverColor: lButtonColor.withOpacity(0.1),
                                border: txtBorder,
                                focusedBorder: txtBorder,
                                enabledBorder: txtBorder,
                                disabledBorder: txtBorder,
                                contentPadding: EdgeInsets.all(10),
                                hintText: "**********",
                                hintStyle: editTextHintStyle,
                              ),
                              style: editTextStyle,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginWithIdPage()),
                                );
                              },
                              child: Container(
                                height: 50.0,
                                width: 150.0,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                alignment: FractionalOffset.center,
                                decoration: new BoxDecoration(
                                  color: lButtonColor,
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(30.0)),
                                ),
                                child: AutoSizeText(
                                  "LOG IN",
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Terms of use & Privacy Policy",
                              style: new TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        )),


                  ],
                ),
              ),
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
                          child: SizedBox(width: 30, height: 30, child: Icon(Icons.arrow_back_ios)),
                          onTap: () {Navigator.of(context).pop();},
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
