import 'package:flutter/material.dart';

import 'C_Projects.dart';
import '../Constants.dart';

// Accordion Head Template
Widget accordionHeadTemplate(Text str, TextStyle style) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          decoration: kProject_BoxDecorationStyle,
          child: Column(
            children: <Widget>[
              Text(
                str.data,
                overflow: TextOverflow.ellipsis,
                style: style,
              ),
            ],
          ),
        ),
        sizeBox_Spacing(10),
      ],
    ),
  );
}
