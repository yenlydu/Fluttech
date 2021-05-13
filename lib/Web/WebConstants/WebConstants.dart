import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

enum Navigation {
  HANDLE_PROJECTS,
  HANDLE_USERS,
  PROFILE,
}

final spaceBetweenWidgets = SizedBox(
  height: 25.0,
);

final hamburgerIcon = Icon(
  Icons.menu,
  color: Colors.deepPurple,
  size: 30.0,
);

String formatter(DateTime dateTime)
{
  return DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
}

class NavigationsButtonsStyle {
  final callback;
  Widget content;
  BoxDecoration boxDecoration;
  double width;
  NavigationsButtonsStyle(this.callback, this.content, this.boxDecoration, this.width);

  Widget button() {
    // TODO: implement build
    return InkWell(
      onTap: callback,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        height: 30,
        width: this.width,
        decoration: boxDecoration,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: content
          ),
        ),
      ),
    );
  }
}

