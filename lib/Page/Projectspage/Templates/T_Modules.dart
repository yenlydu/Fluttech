import 'package:flutter/material.dart';

import '../../../Model/Constants.dart';

class T_Modules extends StatelessWidget {
  const T_Modules({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 400,
                width: 601,
                color: Colors.orange,
              ),
              kSizeBox_Space10,
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 600,
                width: 601,
                color: Colors.blue,
              ),
            ],
          ),
        )
      ],
    );
  }
}
