import 'package:flutter/material.dart';

//LOGIN

/* Hint Text Style */
final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

/* Label Text Style */
final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

/* Box Decoration Style */
final kBoxDecorationStyle = BoxDecoration(
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

Widget login_Title() {
  return Text(
    "Log In",
    style: TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget login_Button() {
  return Text(
    'LOGIN',
    style: TextStyle(
      color: Color(0xFF527DAA),
      letterSpacing: 1.5,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'OpenSans',
    ),
  );
}

/* Input Decoration Style */
final kInputDeco_pwd = InputDecoration(
  border: InputBorder.none,
  contentPadding: EdgeInsets.only(top: 14.0),
  prefixIcon: Icon(Icons.lock, color: Colors.white),
  hintText: "Enter your Password",
  hintStyle: kHintTextStyle,
);

/* Input Decoration Style */
final kInputDeco_email = InputDecoration(
  border: InputBorder.none,
  contentPadding: EdgeInsets.only(top: 14.0),
  prefixIcon: Icon(Icons.email, color: Colors.white),
  hintText: "Enter your Email",
  hintStyle: kHintTextStyle,
);
