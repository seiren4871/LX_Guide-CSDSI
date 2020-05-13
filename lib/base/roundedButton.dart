import 'package:flutter/material.dart';
import 'package:lx_building/colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;

  const RoundedButton(
      {Key key,
        @required this.text,@required this.width,@required this.height, })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: lButtonColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
      ),
      child: Text(
        text,
        style: new TextStyle(
            color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
