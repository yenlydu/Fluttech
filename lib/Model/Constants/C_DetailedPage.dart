import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'C_Projects.dart';
import '../Constants.dart';

Widget studentName(Text name) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Text(
      name.data,
      style: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        fontFamily: 'OpenSans',
      ),
    ),
  );
}

Widget textDPboth_title(Text name, TextStyle style) {
  return Container(
    child: Text(
      name.data,
      style: style,
    ),
  );
}

Widget textDP_elem1(Text name, TextStyle style) {
  return Container(
    child: Text(
      name.data,
      style: style,
    ),
  );
}

Widget textDP_elem2(Text name, TextStyle style) {
  return Container(
    alignment: Alignment.topLeft,
    child: Text(
      name.data,
      style: style,
    ),
  );
}
