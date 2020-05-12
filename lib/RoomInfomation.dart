import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lxguide/main.dart';
import 'contact.dart';
import 'theme.dart';
import 'keyword.dart';

//Color.fromRGBO(238, 230, 227, 1)

class Background extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: 'Room Infomation',
//      theme: _colorTheme,

//      home: Container(
//        decoration: BoxDecoration(color: Color.fromRGBO( 222,205,190, 1) ),

      home: Scaffold(
        backgroundColor: Color.fromRGBO(237, 229, 227, 1),
        bottomNavigationBar: bottomNavigation(context),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(237, 229, 227, 1),
          title: IconButton(
              icon: Icon(
                Icons.dehaze,
                color: Colors.pinkAccent,
              ),
              onPressed: () {}
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
//              direction: Axis.vertical,
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: Text("ESCAPE ROOM",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.pink)
                  ),
                ),
//
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
//                height:450,
//                width: 320,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25.0),
                    ),

                    child: Column(
//                      runSpacing: 4.0,
//                      direction: Axis.vertical,
//                      spacing: 4.0,
                      children: <Widget>[
//                        Container(
//                          decoration: BoxDecoration(
//                        image: DecorationImage(
//                          image: AssetImage("assets/issoria-team-careers.png"),
//                          fit: BoxFit.fitWidth,
//                        ),
                        Image(
                          height: 200,
                          image: AssetImage("assets/issoria-team-careers.png"),
                          fit: BoxFit.fitWidth,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80,
                              vertical: 8),
                          child: SizedBox(

                            child: Text(
                                "Room Information",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black)
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 65,
                              vertical: 5),
//                             margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
//                              padding: const EdgeInsets.all(16.0),
                          child: Container(
                            child:
                            Text(
                              "   Let's escape from this room !",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Colors.black),
//                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50,
                              vertical: 5),
                          child: SizedBox(
                            height: 50,
//                          color: Colors.blue,
                            child: Keyword(),
                          ),
                        ),
                      SizedBox(

                        child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute( (context) => ))
                        },
                        child: Image.asset('assets/Icon-MapInRoomPage.png',
                        width: 50,
                        height: 50,),
                      ),
                      ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNavigation(BuildContext context) {
    return BottomAppBar(
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
                onPressed: () {
                  Navigator.pop(context);
                },
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
  }
//class RoomInfomation extends StatefulWidget {
//
//  //  title = "Welcome tom my app";
//  RoomInfomation({Key key}) : super(key: key);
//
//  @override
//  _RoomInfomationState createState() => _RoomInfomationState();
////  _TagsState createSecondState() => _TagsState();
//
//}

//class _RoomInfomationState extends State<RoomInfomation> {
//
//  Widget build(BuildContext context ) {
//    return Scaffold(
//      backgroundColor: Colors.transparent,
//      body: Container(
//        decoration: BoxDecoration(
//            border: Border.all(color: Colors.blueAccent)
//        ),
//        child: _listKeyword(),
//      ),
//    );
//  }
////
//
//  Widget _listKeyword() {
//    return Scaffold(
//      backgroundColor: Colors.transparent,
//      body: StreamBuilder(
//        stream: Firestore.instance.collection("keyword").where( ["roomId"].equals("LX1200A") ).snapshots(),
//        builder: (context, snapshot ) {
//          if(!snapshot.hasData ) return const Text("check on keyword syntax please");
//          return _wrapTag(context, snapshot.data.documents );
//        },
//      ),
//    );
//  }
//  Widget _wrapTag(BuildContext context, List<DocumentSnapshot> snapshot) {
////    chil snapshot.map((data) => _showTag(context, data)).toList()
//    return Wrap(
//      spacing: 8.0,
//      runSpacing: 4.0,
////        direction: Axis.vertical,
//      children: snapshot.map((data) => _showTag(context, data)).toList(),
//    );
//  }
//
//  Widget _showTag( BuildContext context, DocumentSnapshot data ) {
//    final tag = GetTags.fromSnapshot(data);
//    return
//      Material(
//        child: RaisedButton(
//          color: Colors.deepPurple,
//          shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(18.0),
//              side: BorderSide(color: Colors.deepPurple)
//          ),
//          child: Text(
//            tag.keywordName,
//            style: TextStyle(color: Colors.white),
//          ),
//          onPressed: () {
//            //navigate to room page
//          },
//        ),
//      );
//  }
//  GetTags showSameResult() {
//    final databaseReference = Firestore.instance;
//
//
//
//  }
//}
}
class Room {
  String roomId;
  String keywordName;

  final DocumentReference reference;

  Room.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['keywordName'] != null),
        assert(map['roomId'] != null),
        keywordName = map['keywordName'],
        roomId = map['roomId'];

  Room.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

}

class GetTags {
  final String keywordName;
  final String roomId;

  final DocumentReference reference;

  GetTags.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['keywordName'] != null),
        assert(map['roomId'] != null ),
        keywordName = map['keywordName'],
        roomId = map['roomId'];

  GetTags.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$keywordName>";

//assert roomId(lxRoom) and roomId(keyword)
}
