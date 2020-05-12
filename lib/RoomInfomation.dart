import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'contact.dart';
import 'drawer.dart';
import 'keyword.dart';
import 'main_IndoorMap.dart';
import 'theme.dart';
//Color.fromRGBO(238, 230, 227, 1)

class Background extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffece3e2),
        bottomNavigationBar: bottomNavigation(context),
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xFFf8777c),
          title: Text("Escape Room"),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            child: SingleChildScrollView(
              child: Column(
//              direction: Axis.vertical,
                children: <Widget>[
                  Container(
//                  color: Colors.red,
                    child: Text("ESCAPE ROOM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xFFf8777c))),
                  ),
//                SingleChildScrollView(
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
//                height:450,
//                width: 320,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 40.0),
                      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
//                        runSpacing: 4.0,
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
                            image:
                                AssetImage("assets/issoria-team-careers.png"),
                            fit: BoxFit.fitWidth,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: SizedBox(
                              child: Text("Room Information",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 5.0),
//                             margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
//                              padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Text(
                                "Let's escape from this room !",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Colors.black),
//                              overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: SizedBox(
                              height: 45,
//                          color: Colors.blue,
                              child: Keyword(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: SizedBox(
                              height: 30,
                              child: RoomInfomation(),
                            ),
                          ),

                          SizedBox(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IndoorMap()),
                                );
                              },
                              child:
                              Image.asset(
                                'assets/Icon-MapInRoomPage.png',
                                width: 70,
                                height: 70,
                              ),
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
      ),
    );
  }

  Widget bottomNavigation(BuildContext context) {
    return BottomAppBar(
      // alignment: Alignment.bottomCenter,
      color: Color(0xFF0d1b46),
      child: Container(
        child: ListTile(
          leading: Container(
            child: SizedBox(
              width: 25,
              height: 25,
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
}

class RoomInfomation extends StatefulWidget {
  //  title = "Welcome tom my app";
  RoomInfomation({Key key}) : super(key: key);

  @override
  _RoomInfomationState createState() => _RoomInfomationState();
//  _TagsState createSecondState() => _TagsState();

}

class _RoomInfomationState extends State<RoomInfomation> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _createTag(),
    );
  }

  final databaseReference = Firestore.instance;
  int count = 0;
  String userInput = "";

  TextEditingController _controller;
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_printControl);
  }

  String _printControl() {
    return _controller.text;
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    await databaseReference.collection("keyword")
        .add({
      'keywordName': "$key",
      'roomId': "lx1200A",
      'distacnce': "null",
    });
//    count++;
    print("keyword: $key have been added successfully !");
  }
// void getRoomName(String ) async {
//
// }

  Future<void> _showMyDialog(BuildContext context) async {
//    TextEditingController _controllerCreateRecord;
    FocusNode focusNode;

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: <Widget>[
              Text('Suggest Tag'),
              Icon(Icons.add),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _controller,
                  focusNode: focusNode,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x4437474F),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: color300),
                    ),
                    border: InputBorder.none,
                    hintText: "Type your keyword",
                    contentPadding: const EdgeInsets.only(
                      left: 16,
                      right: 20,
                      top: 14,
                      bottom: 14,
                    ),
                  ),
                  onChanged: (String text) {
                    setState(() {
                      print(_controller.text);
                      userInput = _controller.text;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'CANCLE',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('SEND REQUEST'),
              onPressed: () {
                createRecord(userInput );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _createTag() {
    return Material(
      child: FlatButton.icon(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.indigo)),
        label: Text(
          "Suggest Tag",
          style: TextStyle(color: Colors.indigo),
        ),
        icon: Icon(Icons.add, color: Colors.indigo),
        onPressed: () {
          _showMyDialog(context);
        },
      ),
    );
  }
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
        assert(map['roomId'] != null),
        keywordName = map['keywordName'],
        roomId = map['roomId'];

  GetTags.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$keywordName>";

//assert roomId(lxRoom) and roomId(keyword)
}
