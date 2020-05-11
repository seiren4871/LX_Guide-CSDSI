// import 'dart:html';

import 'dart:async';

import 'package:flutter_tags/selectable_tags.dart';
import 'package:flutter_tags/input_tags.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:search_widget/search_widget.dart';

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
          body: MyHomePage(),
//          Stack(
//            children: [
//              TagsState(),
//            ],
//          ),
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

}

// previous Page button start

class MyHomePage extends StatefulWidget {

  //  title = "Welcome tom my app";
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
//  _TagsState createSecondState() => _TagsState();

}

//class TagsState extends StatefulWidget {
//
//  //  title = "Welcome tom my app";
//  TagsState({Key key}) : super(key: key);
//
//  @override
////  _MyHomePageState createState() => _MyHomePageState();
//  _TagsState createState() => _TagsState();
//
//}

class _MyHomePageState extends State<MyHomePage> {

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
//
//     Widget _searchBox() {
//      String user_input = "";
//      return
//        Row(
//        children: [
//        Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//          child: Container(
//            decoration: BoxDecoration(
//              border: Border.all(color: Colors.grey),
//              borderRadius: BorderRadius.circular(5.0),
//            ),
//          ),
//        ),
//          Ink(
//            decoration: const ShapeDecoration(
//              color: Colors.green,
//              shape: CircleBorder(),
//            ),
//            child: IconButton(
//              icon: Icon(Icons.search ),
////              onChanged: ( _controller ) {
////                user_input = userSearch --> search function
////              },
//            ),
//          ),
//        ],
//      );
//     }
//
//     Widget _dropDownButton() {
//    //auto show result
//    return DropdownButton<String>(
//      value: ,// list after search type search_input(onChanged)
//      onChanged: (String string) => setState( () => selectedItem = string ),
//       selectedItemBuilder: (BuildContext context ) {
//        return /*list after search*/items.map<Widget>( (String item ) {
//          return Text(item);
//        }).toList();
//       },
//      items: item.map( (String item ) {
//        return DropdownMenuItem<String>(
//          child: ,//List of search
//          value: item,
//        );
//      }).toList(),
//    );
//     }
//    Widget _tag(BuildContext context ) {
//      return Scaffold(
//        body: StreamBuilder(
//            stream: Firestore.instance.collection("keywordTags").snapshots(),
//          builder: (context, snapshot ) {
//              if(!snapshot.hasData ) return const Text("check on keyword syntax please");
//              return _wrapTag(context, snapshot.data.document );
//          },
//        ),
//      );
//    }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
//      appBar: AppBar(title: Text('Baby Name Votes')),
      body: //Stack(
        _listRoom(),
    );
  }

DocumentSnapshot _selectedItem;
bool _show = true;

  Widget _listRoom() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder(
        stream: Firestore.instance.collection("lxroom").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return const Text('Loading');
//          return _buildList(context, snapshot.data.documents);
        return _build(context, snapshot.data.documents );
//          return snapshot.data.documents.map((data) => _build(context, data )).toList();
        },
      ),
    );
  }

  Widget _listKeyword() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder(
        stream: Firestore.instance.collection("keyword").snapshots(),
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
        spacing: 8.0,
        runSpacing: 4.0,
//        direction: Axis.vertical,
        children: snapshot.map((data) => _showTag(context, data)).toList(),
      );
  }

  Widget _showTag( BuildContext context, DocumentSnapshot data ) {
    final tag = GetTags.fromSnapshot(data);
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

  Widget _createTag() {

    return Material(
      child: FlatButton.icon(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.indigo )
        ),
         label:
            Text(
            "Create Tag",
              style: TextStyle(color: Colors.indigo),
            ),
          icon: Icon(Icons.add, color: Colors.indigo),
        onPressed: () {
            _showMyDialog(context);
        },
      ),
    );
  }
  final databaseReference = Firestore.instance;

  int count = 0;



  void createRecord(String key ) async {

    await databaseReference.collection("keyword")
        .document("key$count" )
        .setData({
      'keywordName': "$key",
      'roomId': "null"
    });
    count++;
    print(count);
  }
  String userInput = "";

  Future<void> _showMyDialog(BuildContext context) async {
    TextEditingController _controllerCreateRecord;
    FocusNode focusNode;

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: <Widget> [
              Text('Create Tag'),
              Icon(Icons.add) ,
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
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
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
                      print(_controller.text );
                      userInput = _controller.text;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('SEND REQUEST'),
              onPressed: () {
                  createRecord( _controller.text );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _build(BuildContext context, List<DocumentSnapshot> snapshot) {
//    List<DataFromDb> list = DataFromDb.fromSnapshot(snapshot) ;
//  snapshot.map( (data ) => );

//  final list = DataFromDb.fromSnapshot(snapshot) ;
//    List<DataFromDb> list = DataFromDb.fromSnapshot(snapshot.map( (data) => )).toList();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16),
        child:
          Column(
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              if( _show )
                SearchWidget<DocumentSnapshot>(
                  dataList: snapshot,
                  hideSearchBoxWhenItemSelected: false,
                  listContainerHeight: MediaQuery.of(context).size.height/4,
                  queryBuilder: (query, list ) {
                    return list
                        .where( (item ) => item["roomName"]
                        .toLowerCase()
                        .contains((query.toLowerCase() ) ))
                        .toList();
                  },
                  popupListItemBuilder:  (item ) {
                    return PopupListItemWidget( item );
                  },
                  selectedItemBuilder: ( _selectedItem, deleteSelectedItem) {
                    return SelectedItemWidget( _selectedItem, deleteSelectedItem);
                  },
                  // widget customization
                  noItemsFoundWidget: NoItemsFound(),
                  textFieldBuilder: (controller, focusNode ) {
                    return MyTextField(controller, focusNode );
                  },
                  onItemSelected: (item) {
                    setState( () {
//                      _selectedItem = item;
                    });
                  },
                ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 300,
                  child:  _listKeyword(),

                ),
              _createTag(),




//            Text(
//              "${_selectedItem != null ? _selectedItem["roomName"] : "" "No Item selected "}",
//            ),
            ],
        ),
      ),
    );
  }

}


//  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
//    return ListView(

//      padding: const EdgeInsets.only(top: 20.0),
//      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
//    );
//  }
//  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//    final users = Users.fromSnapshot(data);
//
//    return Padding(
//      key: ValueKey(users.name),
//      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//      child: Container(
//        decoration: BoxDecoration(
//          border: Border.all(color: Colors.grey),
//          borderRadius: BorderRadius.circular(5.0),
//        ),
//        child: ListTile(
//          title: Text(users.name),
//            trailing: Text(users.email.toString()),
//          onTap: () => print(users),
//        ),
//      ),
//    );
//  }
//
//}
//class GetData {
//  List<String> list = [];
//  // ignore: close_sinks
//  StreamController<String> streamController = new StreamController.broadcast();
//
////  @override
//  void initState() {
////    super.initiState();
//
//    print("Creating a StreamController .. ");
//
//    //1st sub
//    streamController.stream.listen( (data) {
//      print("dataReceived1:" + data );
//    }, onDone: () {
//      print("task Done1")
//    }, onError: () {
//      print("some Error1")
//    } );
//
//    //2nd
//    streamController.stream.listen( (data) {
//      print("DataRecieved2: " + data);
//    }, onDone: () {
//      print("Ondone " + data ) ;
//    }, onError: () {
//      print("Error2");
//    });
//    streamController.add("this a test data");
//    print("code controller is here");
//  }
//}

class SelectedItemWidget extends StatelessWidget {
    const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);

    final DocumentSnapshot selectedItem;
    final VoidCallback deleteSelectedItem;
    @override
    Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 4,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 8,
                  bottom: 8,
                ),
                child: Text(
                  selectedItem["roomName"],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete_outline, size: 22),
              color: Colors.grey[700],
              onPressed: deleteSelectedItem,
            ),
          ],
        ),
      );
    }
}

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
      child:
      Wrap(
        children: <Widget>[
          TextField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x4437474F),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          border: InputBorder.none,
          hintText: "Type room/activity for navigation..",
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
          ClipOval(
            child: Material(
              color: Colors.teal, // button color
              child: InkWell(
                splashColor: Colors.green, // inkwell color
                child: SizedBox(width: 50, height: 50, child: Icon(Icons.search)),
                onTap: () {
                },
              ),
            ),
          )
      ],
      ),
    );
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900].withOpacity(0.7),
        ),
        const SizedBox(width: 10),
        Text(
          "No Items Found",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900].withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.item);

  final DocumentSnapshot item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: ListTile(

        leading: Text( item['roomName'], style: const TextStyle(fontSize: 16) ),
        trailing:  Text( item["distance"] + " away ", style: const TextStyle(fontSize: 16) ),
      ),

    );
  }
}

class DataFromDb {
  String roomId;
  String keywordName;

  final DocumentReference reference;

  DataFromDb.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['keywordName'] != null),
        assert(map['roomId'] != null),
        keywordName = map['keywordName'],
        roomId = map['roomId'];

  DataFromDb.fromSnapshot(DocumentSnapshot snapshot)
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




