import 'package:LXGuide/SearchRoomPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:LXGuide/home/home.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:LXGuide/drawer.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {

  final int _numPages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFf8777d) : Color(0xFF0d1b46),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigation(context),
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFFf8777c),
        title: Text("Tutorial"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Image.asset(
                        "assets/img/tutorial.png",
                        height: 79.0,
                        width: 169,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    alignment: FractionalOffset.center,
                    decoration: new BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(50.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ));
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: Color(0xFF0d1b46),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 350.0,
                            child: PageView(
                              physics: ClampingScrollPhysics(),
                              controller: _pageController,
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage = page;
                                });
                              },
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Container(
                                          width: 200.0,
                                          height: 200.0,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFFf8777c),
                                                width: 2.0,
                                              ),
                                              image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/img/search.jpg')))),
                                      SizedBox(height: 20.0),
                                      Text(
                                        'Search Room',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF0d1b46)),
                                      ),
                                      SizedBox(height: 15.0),
                                      Text(
                                        'Search Room Feature is make you\nto be find your room easier.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF0d1b46),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Container(
                                          width: 200.0,
                                          height: 200.0,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFFf8777c),
                                                width: 2.0,
                                              ),
                                              image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/img/navigate.jpg')))),
                                      SizedBox(height: 20.0),
                                      Text(
                                        'Indoor Map',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0d1b46),
                                        ),
                                      ),
                                      SizedBox(height: 15.0),
                                      Text(
                                        'Guide you to be able to reach your destination!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF0d1b46),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              child: Container(
                                height: 50.0,
                                width: 150.0,
                                margin: EdgeInsets.all(10.0),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                alignment: FractionalOffset.center,
                                decoration: new BoxDecoration(
                                  color: Color(0xFF65bcbf),
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(30.0)),
                                ),
                                child: AutoSizeText(
                                  "GET STARTED",
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xFF0d1b46),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
