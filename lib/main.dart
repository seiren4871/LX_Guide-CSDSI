// import 'dart:html';

import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:lx_guide/informationPage.dart';
import 'package:lx_guide/main_IndoorMap.dart';
import 'package:flutter/services.dart';
import 'contact.dart';
import 'theme.dart';

final ThemeData _colorTheme = _buildColorTheme();
ThemeData _buildColorTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: color50,
    primaryColor: color300,
    scaffoldBackgroundColor: BackgroundWhite,
    cardColor: BackgroundWhite,
    textSelectionColor: color100,
    errorColor: ErrorRed,
  );
}
=======
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase/firestore.dart';
// import 'package:firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'dart:async';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/widgets.dart';
import 'package:search_widget/search_widget.dart';
>>>>>>> ad7201275083f9d015b7d3bbbbc8ade209c338a1

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
<<<<<<< HEAD
      theme: _colorTheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
=======
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.fill,
            )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar:  bottomNavigation,
          appBar: AppBar(
              title: IconButton(
                  icon: Icon(
                    Icons.dehaze,
                    color: Colors.pinkAccent,
                  ),
                  onPressed: () {})),
          body: Stack(
            children: [
              MyHomePage()
            ],
          ),
        ),

      ),
>>>>>>> ad7201275083f9d015b7d3bbbbc8ade209c338a1
    );
  }

  final  bottomNavigation = BottomAppBar(
    // alignment: Alignment.bottomCenter,
    color: Colors.transparent,
    child: Container(
      child: ListTile(
        leading: Container(
          child: SizedBox(
            width: 25,
            height: 25,
            child: MaterialButton(
              onPressed: () {},
              padding: EdgeInsets.all(2),
              color: Colors.lightBlue,
              shape: CircleBorder(),
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
            ),
          ),
        ),
        trailing: Container(
          child: SizedBox(
            child: FlatButton(
              // padding: EdgeInsets.all(1),
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  text: "Contact Us",
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
//formstate in request the new tag

}

<<<<<<< HEAD
  final String title;
=======
// previous Page button start

class MyHomePage extends StatefulWidget {

  //  title = "Welcome tom my app";
  MyHomePage({Key key}) : super(key: key);
>>>>>>> ad7201275083f9d015b7d3bbbbc8ade209c338a1

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
<<<<<<< HEAD

  Widget submitButton() {
    return RaisedButton(
      child: Text(
        'Contact',
        style: TextStyle(color: Color(0xff000000)),
      ),
      color: Color(0xff64bcbe),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      onPressed: () {
        print('Contact');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => ContactUs());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget mapButton() {
    return RaisedButton(
      child: Text(
        'Indoor Map',
        style: TextStyle(color: Color(0xff000000)),
      ),
      color: Color(0xff64bcbe),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      onPressed: () {
        print('Go to Map');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => IndoorMap());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget informationButton() {
    return RaisedButton(
      child: Text(
        'About',
        style: TextStyle(color: Color(0xff000000)),
      ),
      color: Color(0xff64bcbe),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      onPressed: () {
        print('Go to Map');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => InformationPage());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }
=======
  TextEditingController _controller;
>>>>>>> ad7201275083f9d015b7d3bbbbc8ade209c338a1

  Widget build(BuildContext context) {
<<<<<<< HEAD
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'TEST',
            ),
            submitButton(),
            mapButton(),
            informationButton(),
          ],
=======
    return Scaffold(
      body: Column(
        children: <Widget>[
          _searchBox(),
          //_tagKeywords() show tag only ... ,
        ],
      ),
//      _buildBody(context),
    );
  }

  void initState() {
    super.initState();
    _controller = TextEditingController();

  }
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

     Widget _searchBox() {
      String user_input = "";
      return
        Row(
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
          Ink(
            decoration: const ShapeDecoration(
              color: Colors.green,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.search ),
//              onChanged: ( _controller ) {
//                user_input = userSearch --> search function
//              },
            ),
          ),
        ],
      );
     }

     Widget _dropDownButton() {
    //auto show result
    return DropdownButton<String>(
      value: ,// list after search type search_input(onChanged)
      onChanged: (String string) => setState( () => selectedItem = string ),
       selectedItemBuilder: (BuildContext context ) {
        return /*list after search*/items.map<Widget>( (String item ) {
          return Text(item);
        }).toList();
       },
      items: item.map( (String item ) {
        return DropdownMenuItem<String>(
          child: ,//List of search
          value: item,
        );
      }).toList(),
    );
     }
    Widget _tag(BuildContext context ) {
      return Scaffold(
        body: StreamBuilder(
            stream: Firestore.instance.collection("keywordTags").snapshots(),
          builder: (context, snapshot ) {
              if(!snapshot.hasData ) return const Text("check on keyword syntax please");
              return _wrapTag(context, snapshot.data.document );
          },
>>>>>>> ad7201275083f9d015b7d3bbbbc8ade209c338a1
        ),
      );
    }

  Widget _wrapTag(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: snapshot.map((data) => _showTag(context, data)).toList(),
    );
  }

     Widget _showTag( BuildContext context, DocumentSnapshot data ) {
        final tag = Tags.fromSnapshot(data);
        return
          Material(
            color: Colors.deepPurple,
            child: FlatButton(
              child: Text(
                tag.keywordName,
                style: TextStyle(color: Colors.white ),
              ),
          ),
        );
     }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection("lxroom").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return const Text('Loading');
          return _buildList(context, snapshot.data.documents);
        },
      ),
<<<<<<< HEAD
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'back',
        child: Icon(Icons.arrow_back),
      ), // This trailing comma makes auto-formatting nicer for build methods.
=======
>>>>>>> ad7201275083f9d015b7d3bbbbc8ade209c338a1
    );
  }
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final users = Users.fromSnapshot(data);

    return Padding(
      key: ValueKey(users.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(users.name),
            trailing: Text(users.email.toString()),
          onTap: () => print(users),
        ),
      ),
    );
  }

}
class SearchFunction {
  String userInput;
  String tagKeyword;

  //expression /*?()[]

  //search userInput --> DB --> REcord Class

// record result --> $variable --> record class

}
class Tags {
  final String keywordName;
  final String roomId;

  final DocumentReference reference;

  Tags.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['keywordName'] != null),
        assert(map['roomId'] != null),
        keywordName = map['keywordName'],
        roomId = map['roomId'];

  Tags.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$keywordName>";

  //assert roomId(lxRoom) and roomId(keyword)
}

class Users {
  final String name;
  final int email;
  final DocumentReference reference;

  Users.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['roomName'] != null),
        assert(map['floor'] != null),
        name = map['roomName'],
        email = map['floor'];

  Users.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$email>";
}