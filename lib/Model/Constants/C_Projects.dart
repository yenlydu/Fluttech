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

/* Accordion Box Decoration Style */
final kProject_AccordionBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFEBEBEB),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

/* Accordion Label Text Style */
final kProject_AccordionStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

/* Accordion Label Text Style */
final kProject_AccordionDescStyle = TextStyle(
  color: Colors.black,
  fontSize: 10,
  fontWeight: FontWeight.w400,
  fontFamily: 'OpenSans',
);
