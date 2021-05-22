import 'package:flutter/material.dart';

Widget actionsButton(TextStyle textStyle, IconData icon, String text)
{
  if (textStyle == null) {
    return Column(
      children: [
        Icon(icon, size: 14 ,),
        SizedBox(width: 5,),
        Text(text, style: TextStyle(fontSize: 12),),
      ],
    );
  } else {
    return Column(
      children: [
        Icon(icon, size: textStyle.fontSize+2 ,),
        SizedBox(width: 5,),
        Text(text, style: textStyle,                 textAlign: TextAlign.center,
        ),
      ],
    );

  }

}