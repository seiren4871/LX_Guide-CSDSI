import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class Keyword extends StatelessWidget {
  void getData() {
    // Create a reference to the cities collection
    CollectionReference citiesRef = Firestore.instance.collection("keyword");

// Create a query against the collection.
    Query query = citiesRef.where("roomId", isEqualTo: "lx1200A");

    print(query);
  }

  Widget build(BuildContext context ) {
    return
        _listKeyword();

  }
}

Widget _listKeyword() {
  return Scaffold(
    backgroundColor: Colors.transparent,
    body: StreamBuilder(
      stream: Firestore.instance.collection("keyword").where('roomId', isEqualTo: "lx1200A").snapshots(),
      builder: (context, snapshot ) {
        if(!snapshot.hasData ) return const Text("check on keyword syntax please");
        return _wrapTag(context, snapshot.data.documents );
      },
    ),
  );
}

Widget _wrapTag(BuildContext context, List<DocumentSnapshot> snapshot) {
//    chil snapshot.map((data) => _showTag(context, data)).toList()
  return Wrap(
//    padding: const EdgeInsets.only(top: 20.0),
    direction: Axis.horizontal,
    spacing: 5,
    children:
      snapshot.map((data) => _showTag(context, data)).toList(),
  );
//    Wrap(
//    spacing: 8.0,
//    runSpacing: 3.0,

//  );
}

Widget _showTag( BuildContext context, DocumentSnapshot data ) {
  final tag = Tags.fromSnapshot(data);
  print(tag.keywordName );
  return
    Material(
      child: RaisedButton(
        color: Colors.deepPurple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.deepPurple)
        ),
        child: Text(
          tag.keywordName,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          //navigate to room page
        },
      ),
    );
}
