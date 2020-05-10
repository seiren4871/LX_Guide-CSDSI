 import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
 import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:search_widget/search_widget.dart';
//import 'package:lx_guide/search';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
//              MyHomePage()
//            Search(),
//            MyHomePage(),
            ],
          ),
        ),

      ),
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

// previous Page button start

//class MyHomePage extends StatefulWidget {
//
//  //  title = "Welcome tom my app";
//  MyHomePage({Key key}) : super(key: key);
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  TextEditingController _controller;
//
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        children: <Widget>[
////          _listforsearch(context),
////          _searchBox(),
//          //_tagKeywords() show tag only ... ,
//        ],
//      ),
//
//    );
//  }
//
//  void initState() {
//    super.initState();
//    _controller = TextEditingController();
//
//  }
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//
//  List<Room> list = [];
//  Widget  _listforsearch(BuildContext context )  {
//  return Scaffold(
//      body: StreamBuilder(
//      stream: Firestore.instance.collection("lxroom").snapshots(),
//    builder: (context, snapshot) {
//    List<Widget> children;
//    if(!snapshot.hasData) return const Text('Loading');
////    return list = snapshot.data.documents;
//    return _buildList(context, snapshot.data.documents);
//      }
//    ),
//    );
//  }
//
//  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
//    return ListView(
//      padding: const EdgeInsets.only(top: 20.0),
//      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
//    );
//  }
//  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//    final users = Room.fromSnapshot(data);
//
//    return Padding(
//      key: ValueKey(users.keywordName),
//      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//      child: Container(
//        decoration: BoxDecoration(
//          border: Border.all(color: Colors.grey),
//          borderRadius: BorderRadius.circular(5.0),
//        ),
//        child: ListTile(
//          title: Text(users.keywordName),
//            trailing: Text(users.roomId),
//          onTap: () => print(users),
//        ),
//      ),
//    );
//  }
//
//
////  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
////    return ListView(
////      padding: const EdgeInsets.only(top: 20.0),
//////      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
////    );
////  }
//
//}

 class Room {
   final String keywordName;
   final String roomId;

   final DocumentReference reference;

   Room.fromMap(Map<String, dynamic> map, {this.reference})
       : assert(map['keywordName'] != null),
         assert(map['roomId'] != null),
         keywordName = map['keywordName'],
         roomId = map['roomId'];

   Room.fromSnapshot(DocumentSnapshot snapshot)
       : this.fromMap(snapshot.data, reference: snapshot.reference);

   @override
   String toString() => "Record<$keywordName>";

//assert roomId(lxRoom) and roomId(keyword)
 }
//class SearchFunction {
//  String userInput;
//  String tagKeyword;
//
//  //expression /*?()[]
//
//  //search userInput --> DB --> REcord Class
//
//// record result --> $variable --> record class
//
//}


