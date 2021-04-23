import '../../main.dart';
import '../../Model/Constants.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          child: Center(
            child: Container(
              padding: new EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  OutlineButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {},
                    child: Text(
                      "Ugo Test",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
