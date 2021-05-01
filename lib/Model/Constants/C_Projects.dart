import 'package:flutter/material.dart';

/* Label Text Style */
final kProject_Style = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

/* Box Decoration Style */
final kProject_BoxDecorationStyle = BoxDecoration(
  color: Color(0xFF9989BD),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
