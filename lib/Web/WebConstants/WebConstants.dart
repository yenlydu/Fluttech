import 'package:flutter/material.dart';
import 'package:flutter2/Web/Dashboard/dashboardBar.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

enum Navigation {
  HANDLE_PROJECTS,
  HANDLE_USERS,
  PROFILE,
}

final hamburgerIcon = Icon(
  Icons.menu,
  color: Colors.deepPurple,
  size: 30.0,
);

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

