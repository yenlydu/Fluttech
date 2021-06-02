import 'package:flutter/material.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';

Widget actionsButton(
    BuildContext context, TextStyle textStyle, IconData icon, String text) {
  if (textStyle == null) {
    return Column(
      children: [
        Flexible(
          child: Icon(
            icon,
            size: 14,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        !ResponsiveLayout.isSmallScreen(context)
            ? Flexible(
                child: Text(
                text,
                style: TextStyle(fontSize: 12),
              ))
            : Flexible(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 8),
                ),
              )
      ],
    );
  } else {
    return Column(
      children: [
        Flexible(
          child: Icon(
            icon,
            size: textStyle.fontSize + 2,
          ),
        ),
        Flexible(
          child: SizedBox(
            width: 5,
          ),
        ),
        Flexible(
            child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        )),
      ],
    );
  }
}
