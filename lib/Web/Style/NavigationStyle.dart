import 'package:flutter/material.dart';

BoxDecoration decoration()
{
  return  BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.circular(18),
      gradient:LinearGradient(
        colors: [Color(0xFFC798E9), Color(0xFFD5C0E5), Color(0xFFFFFFFF)],

        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      )
  );
}

Widget navbarRowItems()
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: decoration(),
        child: Center(
          child: Image.asset('images/icon.png'),
        ),
      ),
      SizedBox(
        width: 16,
      ),
      Text("FluTECH", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, fontFamily: "Butler", ),)
    ],
  );

}