import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lx_building/home/home.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import '../colors.dart';

class NavigatePage extends StatefulWidget {
  @override
  _NavigatePageState createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {

  final _items = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.pink,
  ];

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFece5e3),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0XFFee6277),
            size: 35.0,
          ),
          onPressed: () {},
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
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
                        "assets/images/tutorial.png",
                        height: 60.0,
                        width: 180,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    alignment: FractionalOffset.center,
                    decoration: new BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(30.0)),
                    ),

                    child: Column(
                      children: <Widget>[
                        _buildPageView(),
                        _buildCircleIndicator(),
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
                                color: lButtonColor,
                                borderRadius: new BorderRadius.all(
                                    const Radius.circular(30.0)),
                              ),
                              child: AutoSizeText(
                                "CONTINUE",
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: lButtonColor, // button color
                        child: InkWell(
                          splashColor: Colors.white, // inkwell color
                          child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.arrow_back_ios)),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                    Text(
                      "Contact us",
                      style: new TextStyle(
                          color: lButtonColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPageView() {
    return Container(
      height: 400.0,
      child: PageView.builder(
          itemCount: _items.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 20.0,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    child: Image.asset(
                      "assets/images/navigation.png",
                      height: 220.0,
                      width: 220,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 15.0,),
                AutoSizeText(
                  "Naviagtion Featuures",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 19.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w800),
                ),
                AutoSizeText(
                  "Guide you to be able to reach the LX\nbuilding.",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 15.0,),
              ],
            );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 80.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: _items.length,
          currentPageNotifier: _currentPageNotifier,
          dotColor: lButtonColor,
          dotSpacing: 25.0,
          selectedDotColor: kBackgroundBlack.withOpacity(0.6),
        ),
      ),
    );
  }
}
