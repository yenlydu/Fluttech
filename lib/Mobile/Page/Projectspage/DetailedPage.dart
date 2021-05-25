import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../Model/Constants.dart';
import '../../../Model/Constants/C_Projects.dart';

class DetailedPage extends StatelessWidget {
  const DetailedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
