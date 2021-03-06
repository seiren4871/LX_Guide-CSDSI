import 'package:LXGuide/drawer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:LXGuide/home/tutorial.dart';
import 'package:LXGuide/contactNoLogin.dart';
import '../colors.dart';
import 'package:LXGuide/SearchRoomPage.dart';
import 'package:LXGuide/singleton.dart';

final GlobalKey<FormState> _emailKey  = GlobalKey<FormState>();
final GlobalKey<FormState> _idKey  = GlobalKey<FormState>();
final mainKey = GlobalKey<ScaffoldState>();

//final GlobalKey<Drawer> drawerKey = GlobalKey();

bool loggedIn = false;

class LoginWithIdPage extends StatefulWidget {
  @override
  _LoginWithIdPageState createState() => _LoginWithIdPageState();
}

class _LoginWithIdPageState extends State<LoginWithIdPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
//  final textController = TextEditingController();

  TextStyle editTextStyle =
      TextStyle(color: kTextBlack.withOpacity(0.8), fontSize: 16.0);

  TextStyle editTextHintStyle =
      TextStyle(color: kTextBlack.withOpacity(0.4), fontSize: 16.0);

  OutlineInputBorder txtBorder = OutlineInputBorder(
    borderSide: BorderSide(color: lButtonColor.withOpacity(0.1)),
    borderRadius: BorderRadius.circular(5.0),
  );



  bool _autoValidate = false;

  String email;
  String studentId;
  List<String> _checkYear = ["56", "57", "58", "59", "60" , "61", "62" ];
  @override

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
//    textController.text = appData.emailOrIdFromGuest;

    return Scaffold(
      key: mainKey,
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: bottomNavigation(context),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        child: loggedIn == false ?
        Stack(
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
                            Form(
                              key: _emailKey,
                              autovalidate: _autoValidate,
                              child: TextFormField(
                                controller: _emailController,
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.emailAddress,
                                validator: _validateEmail,
                                onSaved: (String value) {
                                    email = value;
                                    appData.emailOrIdFromGuest = value;
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
                            ),

                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Student ID",
                              textDirection: TextDirection.ltr,
                              style: new TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Form(
                              key: _idKey,
                              autovalidate: _autoValidate,
                              child: TextFormField(
                                controller: _passwordController,
                                textAlign: TextAlign.start,
                                obscureText: false,
                                validator: ( String id ) {

                                  if( !_checkYear.contains(id.substring(0, 2) ) ) {
                                    return "invalid ID";
                                  }else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.visiblePassword,
                                onSaved: ( String value) {
                                  studentId = value;
                                  appData.studentIdOrName = value;
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
                            ),

                            SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                              _validateForm();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TutorialPage()),
                                ); },

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
        ) : Navigator.push( context, MaterialPageRoute(builder: (context) => SearchRoom() )),

      ),
    );
  }

  String _validateEmail(String email) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+){1})|(\".+\"))@((mail)\.kmutt\.(ac)\.(th))$';
    RegExp reg = new RegExp(pattern);
    if(!reg.hasMatch(email ) ) {
      return "insert your KMUTT email";
    }else {
      return null;
    }
  }

  void setLoginValueToFalse() {
    setState(() {
      loggedIn = false;
    });
  }

  void _validateForm() {
    if(_emailKey.currentState.validate()
        && _idKey.currentState.validate() ) {

      _emailKey.currentState.save();
      _idKey.currentState.save();

      setState(() {
        loggedIn = true;
      });

//    mainKey.currentState.showSnackBar(snackbar);
      print('user email : $email' );
      print('student id : $studentId');
      print('status : $loggedIn');

    }else {
      setState(() {
        _autoValidate = true;
      });
    }
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
