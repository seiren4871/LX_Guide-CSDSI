import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';
import 'drawer.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

enum ConfirmAction { CANCEL, ACCEPT }


class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Back');
          MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => SearchRoom());
          Navigator.of(context).push(materialPageRoute);
        },
        tooltip: 'back',
        child: Icon(Icons.arrow_back),
        foregroundColor: Color(0xFF0e1b47),
        backgroundColor: Color(0xFF66bcc0),
        mini: true,
      ),
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

  TextEditingController _controllerMessenger;
  TextEditingController _controllerName;
  TextEditingController _controllerEmail;

  void initState() {
    super.initState();
    _controllerMessenger = TextEditingController();
    _controllerMessenger.addListener(_printControlMessenger);
    _controllerName = TextEditingController();
    _controllerName.addListener(_printControlName);
    _controllerEmail = TextEditingController();
    _controllerEmail.addListener(_printControlEmail);
  }
  String _printControlMessenger() {
    return _controllerMessenger.text;
  }
  String _printControlName() {
    return _controllerName.text;
  }
  String _printControlEmail() {
    return _controllerEmail.text;
  }
  void disposeMessenger() {
    _controllerMessenger.dispose();
    super.dispose();
    _controllerName.dispose();
    _controllerEmail.dispose();

  }

//
  String message = "";
  Widget messageTag() {

    return new Container(
      height: 100.0,
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: new ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 200.0,
        ),
        child: TextField(
          controller: _controllerMessenger,
          enabled: true,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: 7,
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
          onChanged: (String text ) {
            setState(() {
              print( _controllerMessenger.text );
              message = _controllerMessenger.text;
            });
          },
        ),
      ),
    );
  }

String name = "";
  Widget nameTag() {
    return new Container(
      height: 50.0,
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: TextField(
        controller: _controllerName,
        enabled: true,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.text,
        maxLines: null,
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
        onChanged: (String text ) {
          setState(() {
            print(_controllerName.text);
            name = _controllerName.text;
//            _controller.dispose();
          });
        },
      ),
    );
  }
String email = "";
  Widget emailTag() {
    return new Container(

      height: 50.0,
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: TextField(
        controller: _controllerEmail,
        enabled: true,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.emailAddress,
        maxLines: null,
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
        onChanged: (String text ) {
          setState(() {
            print(_controllerEmail.text );
            email = _controllerEmail.text;
          });
        },
      ),
    );
  }

  Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
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
                createContact( name, email , message );
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
                MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => SearchRoom());
                Navigator.of(context).push(materialPageRoute);
              },
            )
          ],
        );
      },
    );
  }
  final databaseReference = Firestore.instance;
  int count;

  void createContact(String name, email, message ) async {

    await databaseReference.collection("contactUs")
//        .document("key$count" )
        .add({
      'name': name,
      'messeage': message,
      'email': email,
    });

    print(" message: $message, name: $name, email: $email");
  }
}

