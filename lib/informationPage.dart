import 'package:flutter/material.dart';
import 'package:lxguide/main.dart';
import 'theme.dart';
import 'drawer.dart';
import 'package:lxguide/main.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFFf8777c),
        title: Text("About LX Building"),
      ),
      body: SingleChildScrollView(
        child: new SafeArea(
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
                color: Color(0xffffffff).withOpacity(0.8),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: new EdgeInsets.all(10.0),
              margin: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 40.0),
              child: Column(
                children: <Widget>[
                  Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 25, 10, 5),
                        child: Image.asset("assets/img/LXBuilding.png"),
                      )),
                  Center(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 20),
                          child: Text("About LX Building",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0e1b47),
                                fontSize: 20.0,
                              )))),
                  Center(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(
                            "Learning Exchange Building is a building designed in accordance with the new teaching and learning style, which discusses creating a suitable environment for learning both inside and outside of the classroom (Learning and Living Campus). According to King Mongkut's University of Technology Thonburi, they aims to develop and improve the teaching and learning process. Support building users able to perceive multidisciplinary information by using Information and Communication Technology to learn completely in accordance with the new knowledge management cycle. Resulting in joint learning Without subject limit In nurturing students in terms of quality habits and views For development into an educational leader in the 21st century.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF0e1b47),
                                fontSize: 14.0))),
                  ),
                  // backButton(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Back');
//          MaterialPageRoute materialPageRoute =
//              MaterialPageRoute(builder: (BuildContext context) => SearchRoom());
//          Navigator.of(context).push(materialPageRoute);
        Navigator.pop(context);
        },
        tooltip: 'back',
        child: Icon(Icons.arrow_back),
        foregroundColor: Color(0xFF0e1b47),
        backgroundColor: Color(0xFF66bcc0),
        mini: true,
      ),
    );
  }

  // Widget backButton() {
  //   return Align(
  //     alignment: Alignment.bottomCenter,
  //     child: RaisedButton(
  //       padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
  //       onPressed: () {
  //         print('Back');
  //         MaterialPageRoute materialPageRoute =
  //             MaterialPageRoute(builder: (BuildContext context) => MyApp());
  //         Navigator.of(context).push(materialPageRoute);
  //       },
  //       child: const Text('Back to Home', style: TextStyle(fontSize: 14.0)),
  //       color: Color(0xff64bcbe),
  //       textColor: Color(0xFF0e1b47),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: new BorderRadius.circular(18.0),
  //       ),
  //       elevation: 5,
  //     ),
  //   );
  // }

  final backgroundImage = new Container(
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/img/bg.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  );
}
