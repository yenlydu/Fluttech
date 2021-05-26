import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../Model/Constants.dart';
import '../../../Model/Constants/C_Projects.dart';

class DetailedPage extends StatelessWidget {
  const DetailedPage(
      {Key key, this.title, this.desc, this.credit, this.start, this.end})
      : super(key: key);
  final Text title;
  final Text desc;
  final Text credit;
  final Text start;
  final Text end;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title.data),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    title.data,
                    style: textStyle_Title,
                  ),
                ),
                sizeBox_Spacing(10),
                separator(5),
                sizeBox_Spacing(25),
                Container(
                  child: Text(
                    desc.data,
                    style: textStyle_Desc,
                  ),
                ),
                sizeBox_Spacing(10),
                separator(2),
                sizeBox_Spacing(10),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Available credits " + credit.data,
                    style: textStyle_Credit,
                  ),
                ),
                sizeBox_Spacing(10),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Between " + start.data,
                    style: textStyle_Date,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "and " + end.data,
                    style: textStyle_Date,
                  ),
                ),
                sizeBox_Spacing(25),
                Container(
                  child: Column(
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () {
                          // Respond to button press
                        },
                        icon: Icon(Icons.check, size: 18),
                        label: Text("Register"),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          // Respond to button press
                        },
                        icon: Icon(Icons.calendar_today, size: 18),
                        label: Text("Appointments"),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          // Respond to button press
                        },
                        icon: Icon(Icons.people, size: 18),
                        label: Text("Create Group"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
