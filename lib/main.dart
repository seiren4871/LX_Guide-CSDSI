// import 'dart:html';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'RoomInfomation.dart';
import 'contact.dart';
import 'package:search_widget/search_widget.dart';
import "drawer.dart";
import 'informationPage.dart';
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

void main() => runApp(SearchRoom());

class SearchRoom extends StatelessWidget {
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LX_Guide',
      theme: _colorTheme,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: bottomNavigation(context),
          drawer: AppDrawer(),
          appBar: AppBar(
            backgroundColor: Color(0xFFf8777c),
            title: Text("Search Room"),
          ),
//          resizeToAvoidBottomPadding: false,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => InformationPage(), ));
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

// previous Page button start

class MyHomePage extends StatefulWidget {
  //  title = "Welcome tom my app";
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
//  _TagsState createSecondState() => _TagsState();

}

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
          if (!snapshot.hasData) return const Text('Loading');
//          return _buildList(context, snapshot.data.documents);
          return _build(context, snapshot.data.documents);
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
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Text("check on keyword syntax please");
          return _wrapTag(context, snapshot.data.documents);
        },
      ),
    );
  }

//
  Widget _wrapTag(BuildContext context, List<DocumentSnapshot> snapshot) {
//    chil snapshot.map((data) => _showTag(context, data)).toList()
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      direction: Axis.horizontal,
      spacing: 5.0,
      runSpacing: 2.0,
      children: snapshot.map((data) => _showTag(context, data)).toList(),
    );
  }

  Widget _showTag(BuildContext context, DocumentSnapshot data) {
    final tag = GetTags.fromSnapshot(data);
    return Material(
      color: Colors.transparent,
      child: RaisedButton(
        color: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
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

  Widget _build(BuildContext context, List<DocumentSnapshot> snapshot) {
//    List<DataFromDb> list = DataFromDb.fromSnapshot(snapshot) ;
//  snapshot.map( (data ) => );

//  final list = DataFromDb.fromSnapshot(snapshot) ;
//    List<DataFromDb> list = DataFromDb.fromSnapshot(snapshot.map( (data) => )).toList();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 5.0, 5.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            if (_show)
              SearchWidget<DocumentSnapshot>(
                dataList: snapshot,
                hideSearchBoxWhenItemSelected: false,
                listContainerHeight: MediaQuery.of(context).size.height / 4,
                queryBuilder: (query, list) {
                  return list
                      .where((item) => item["roomName"]
                          .toLowerCase()
                          .contains((query.toLowerCase())))
                      .toList();
                },
                popupListItemBuilder: (item) {
                  return PopupListItemWidget(item);
                },
                selectedItemBuilder: (_selectedItem, deleteSelectedItem) {
                  return SelectedItemWidget(_selectedItem, deleteSelectedItem);
                },
                // widget customization
                noItemsFoundWidget: NoItemsFound(),
                textFieldBuilder: (controller, focusNode) {
                  return MyTextField(controller, focusNode);
                },
                onItemSelected: (item) {
//                    if( item["roomName"].equals("LX1200A")) {
                  setState(() {
//                      _selectedItem = item;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Background()),
                    );
                  });
                },
              ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 300,
              child: _listKeyword(),
            ),
//
//            Text(
//              "${_selectedItem != null ? _selectedItem["roomName"] : "" "No Item selected "}",
//            ),
          ],
        ),
      ),
    );
  }
}

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

  Widget roomNameTag() {
    return new Container(
      height: 50.0,
      width: 250.0,
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
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
          hintText: 'Type room/activity for navigation..',
          contentPadding: EdgeInsets.all(15.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Color(00000000))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceAround,
        children: <Widget>[
          roomNameTag(),
          ClipOval(
            child: Material(
              color: Color(0xFF65bcbf), // button color
              child: InkWell(
                splashColor: Colors.green, // inkwell color
                child:
                    SizedBox(width: 55, height: 55, child: Icon(Icons.search)),
                onTap: () {},
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
      color: Colors.transparent,
      child: ListTile(
        leading: Text(item['roomName'], style: const TextStyle(fontSize: 16)),
        trailing: Text(item["distance"] + " away ",
            style: const TextStyle(fontSize: 16)),
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

