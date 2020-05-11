import 'package:flutter/material.dart';
import 'package:lx_guide/informationPage.dart';
import 'package:lx_guide/main_IndoorMap.dart';
import 'package:flutter/services.dart';
import 'contact.dart';
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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _colorTheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget submitButton() {
    return RaisedButton(
      child: Text(
        'Contact',
        style: TextStyle(color: Color(0xff000000)),
      ),
      color: Color(0xff64bcbe),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      onPressed: () {
        print('Contact');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => ContactUs());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget mapButton() {
    return RaisedButton(
      child: Text(
        'Indoor Map',
        style: TextStyle(color: Color(0xff000000)),
      ),
      color: Color(0xff64bcbe),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      onPressed: () {
        print('Go to Map');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => IndoorMap());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget informationButton() {
    return RaisedButton(
      child: Text(
        'About',
        style: TextStyle(color: Color(0xff000000)),
      ),
      color: Color(0xff64bcbe),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      onPressed: () {
        print('Go to Map');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => InformationPage());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'TEST',
            ),
            submitButton(),
            mapButton(),
            informationButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'back',
        child: Icon(Icons.arrow_back),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
