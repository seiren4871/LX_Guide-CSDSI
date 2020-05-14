import 'package:flutter/material.dart';
import 'theme.dart';
import 'drawer.dart';
import 'main.dart';
import 'contact.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: bottomNavigation(context),
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
                image: AssetImage("assets/background.jpg"),
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
                            "          Learning Exchange Building is a building designed in accordance with the new teaching and learning style, which discusses creating a suitable environment for learning both inside and outside of the classroom (Learning and Living Campus). According to King Mongkut's University of Technology Thonburi, they aims to develop and improve the teaching and learning process. Support building users able to perceive multidisciplinary information by using information and communication technology to learn completely in accordance with the new knowledge management cycle. Resulting in joint learning Without subject limit in nurturing students in terms of quality habits and views for development into an educational leader in the 21st century.",
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
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           print('Back');
// //          MaterialPageRoute materialPageRoute =
// //              MaterialPageRoute(builder: (BuildContext context) => SearchRoom());
// //          Navigator.of(context).push(materialPageRoute);
//         Navigator.pop(context);
//         },
//         tooltip: 'back',
//         child: Icon(Icons.arrow_back_ios),
//         foregroundColor: Color(0xFF0e1b47),
//         backgroundColor: Color(0xFF66bcc0),
//         mini: true,
      // ),
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
