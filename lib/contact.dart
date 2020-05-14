import 'package:flutter/material.dart';
import 'main.dart';
import 'drawer.dart';
import 'SearchRoomPage.dart';
import 'package:flutter/services.dart';
import 'theme.dart';
import 'package:LXGuide/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

final db  = Firestore.instance;
String name,email,message = "";

void createContact(String name, String email, String message ) async {
  await db.collection("contactUs")
      .add({
    'name': name,
    'email': email,
    'message' : message,

  });
}

enum ConfirmAction { CANCEL, ACCEPT }

Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm?'),
        content: const Text('This will not back to fix it again.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('ACCEPT'),
            onPressed: () {
              createContact(name, email, message );
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
              MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => HomePage());
              Navigator.of(context).push(materialPageRoute);
            },
          )
        ],
      );
    },
  );
}

class _ContactUsState extends State<ContactUs> {
  @override


  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: bottomNavigation(context),
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFFf8777c),
        title: Text("Contact Us"),
      ),
      body: new SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff).withOpacity(0.6),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: new EdgeInsets.all(10.0),
              margin: EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 150.0),
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.feedback),
                    color: Color(0xFFf8777c),
                    iconSize: 80.0,
                    onPressed: null,
                  ),
                  Text(
                    "Contact Us",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:  Color(0xFFf8777c),
                        fontSize: 20.0),
                  ),
                  nameTag(),
                  emailTag(),
                  messageTag(),
                  submitButton(),
                ],
              ),
            ),
          ),
        ),

      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     print('Back');
      //     MaterialPageRoute materialPageRoute =
      //     MaterialPageRoute(builder: (BuildContext context) => SearchRoom());
      //     Navigator.of(context).push(materialPageRoute);
      //   },
      //   tooltip: 'back',
      //   child: Icon(Icons.arrow_back_ios),
      //   foregroundColor: Color(0xFF0e1b47),
      //   backgroundColor: Color(0xFF66bcc0),
      //   mini: true,
      // ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text(
        'Send',
        style: TextStyle(color: Color(0xff214C7D)),
      ),
      color: Color(0xff64bcbe),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(50.0),
      ),
      onPressed: () {
        print('Send');
        _asyncConfirmDialog(context);
      },
    );
  }

  final backgroundImage = new Container(
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/img/bg.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  );

  Widget messageTag() {
    return new Container(
      height: 100.0,
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: new ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 200.0,
        ),
        child: TextField(
          enabled: true,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: 7,
          onSubmitted: (String value) {
            message = value;
          },
          style: new TextStyle(
            color: Color(0xff214C7D),
          ),
          decoration: new InputDecoration(
            fillColor: Color(0xff64bcbe).withOpacity(0.6),
            filled: true,
            hintText: 'Write your message here',
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Color(00000000))),
          ),
        ),
      ),
    );
  }

  Widget nameTag() {
    return new Container(
      height: 50.0,
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: TextField(
        enabled: true,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.text,
        maxLines: null,
        onSubmitted: (String value) {
          name = value;
        },
        style: new TextStyle(
          color: Color(0xff214C7D),
        ),
        decoration: new InputDecoration(
          fillColor: Color(0xff64bcbe).withOpacity(0.6),
          filled: true,
          hintText: 'Write your name here',
          contentPadding: EdgeInsets.all(15.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Color(00000000))),
        ),
      ),
    );
  }

  Widget emailTag() {
    return new Container(
      height: 50.0,
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: TextField(
        enabled: true,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.emailAddress,
        maxLines: null,
        onSubmitted: (String value) {
          email = value;
        },
        style: new TextStyle(
          color: Color(0xff214C7D),
        ),
        decoration: new InputDecoration(
          fillColor: Color(0xff64bcbe).withOpacity(0.6),
          filled: true,
          hintText: 'Write your email here',
          contentPadding: EdgeInsets.all(15.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Color(00000000))),
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