import 'package:flutter/material.dart';

class DahsboardIcon extends StatefulWidget {
  @override
  _DahsboardIconState createState() => _DahsboardIconState();
}

class _DahsboardIconState extends State<DahsboardIcon> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        hoverColor: Colors.white12,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            children: [
              Container(
                height: 60.0,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight:  Radius.circular(10.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
