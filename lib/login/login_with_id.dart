import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:LXGuide/home/tutorial.dart';
import 'package:LXGuide/contactNoLogin.dart';
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
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: bottomNavigation(context),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
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
                      margin: EdgeInsets.only(top: 40.0),
                      child: Image.asset(
                        "assets/img/login.png",
                        height: 80,
                        width: 280,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        padding: EdgeInsets.all(20.0),
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          color: Colors.white70.withOpacity(.6),
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
                              obscureText: true,
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
                                      builder: (context) => TutorialPage()),
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
                                  decoration: TextDecoration.underline,
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
