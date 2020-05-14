import 'package:LXGuide/login/login_with_id.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:LXGuide/home/tutorial.dart';
import 'package:LXGuide/home/home.dart';
import 'package:LXGuide/contactNoLogin.dart';
import 'package:LXGuide/singleton.dart';
import '../colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int gpsCount, switchCount, searchCount = 0;

final GlobalKey<FormState> _emailKey  = GlobalKey<FormState>();
//final GlobalKey<FormState> _idKey  = GlobalKey<FormState>();

class LoginAsGuestPage extends StatefulWidget {
  @override
  _LoginAsGuestPageState createState() => _LoginAsGuestPageState();
}

class _LoginAsGuestPageState extends State<LoginAsGuestPage> {
  final _nameController = TextEditingController();

  TextStyle editTextStyle =
      TextStyle(color: kTextBlack.withOpacity(0.8), fontSize: 16.0);

  TextStyle editTextHintStyle =
      TextStyle(color: kTextBlack.withOpacity(0.4), fontSize: 16.0);

  OutlineInputBorder txtBorder = OutlineInputBorder(
    borderSide: BorderSide(color: lButtonColor.withOpacity(0.1)),
    borderRadius: BorderRadius.circular(5.0),
  );

  List <String> spinnerStatus = [
    'Student',
    'Student from other university',
    'Outsider/Parent',
  ] ;

  String dropdownValue = 'Student';
  String name = "";
  bool _autoValidate = false;

  final db = Firestore.instance;
  void createContact(String name, String role) async {
    await db.collection("guest")
        .add({
      'name' : name,
      'role' : role,
      'gpsFeature' : gpsCount,
      'switchLanguageTime' : switchCount,
      'searchFeature' : searchCount

    });
  }

//  final GlobalKey<FormState> name  = GlobalKey<FormState>();
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
                      margin: EdgeInsets.only(top: 30.0),
                      child: Image.asset(
                        "assets/img/loginAsGuest.png",
                        height: 100,
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
                          color: Colors.white70,
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(30.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Name",
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
                            child: TextFormField(
                              autovalidate: false,
                              controller: _nameController,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.text,
                              validator: (String value) {
                                if(value.length <1 ) return "please insert your name";
                                if(value.length > 12 ) return "your name is too long";
                                return null;
                              },
                              onSaved: ( value) {
                                setState(() {
                                  appData.emailOrIdFromGuest = value;
                                });
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
                                hintText: "Type your name...",
                                hintStyle: editTextHintStyle,
                              ),
                              style: editTextStyle,
                            ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Status",
                              textDirection: TextDirection.ltr,
                              style: new TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              width: double.infinity,
                              decoration: new BoxDecoration(
                                color: lButtonColor.withOpacity(0.1),
                                borderRadius: new BorderRadius.all(
                                    const Radius.circular(5.0)),
                              ),
                              child: DropdownButton<String>(
//                                key: _idKey,
                                value: dropdownValue,
                                icon: Icon(Icons.arrow_drop_down, color: kTextBlack.withOpacity(0.6),),
                                iconSize: 28,
                                elevation: 16,
                                dropdownColor: Colors.white,
                                style: TextStyle(color: kTextBlack.withOpacity(0.6), fontSize: 16),
                                onChanged: (String data) {
                                  setState(() {
                                    dropdownValue = data;
//                                    appData.studentIdOrName = data;
                                    print(dropdownValue);
                                  });
                                },
                                underline: Container(
                                  height: 0,
                                  color: Colors.transparent,
                                ),
                                focusColor: lButtonColor.withOpacity(0.1),
                                autofocus: false,
                                items: spinnerStatus.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),

                            SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                                pressLogin();

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
void pressLogin() {
    if(_emailKey.currentState.validate()
        && dropdownValue != null ) {

      _emailKey.currentState.save();
//      _idKey.currentState.save();

      setState(() {
        appData.studentIdOrName = dropdownValue;
        loggedIn = true;
      });
      print("appData.emailOrIdfromGuest :" + appData.emailOrIdFromGuest );
      print("appData.studentIdOrName :" + appData.studentIdOrName );
      createContact(appData.emailOrIdFromGuest, appData.studentIdOrName );
    } else {
      print("invalid input please check on login as guest file");
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

