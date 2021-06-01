import 'package:flutter/material.dart';

class NavigationButtonsStyle {
  final callback;
  Widget content;
  BoxDecoration boxDecoration;
  double width;

  NavigationButtonsStyle(
      this.callback, this.content, this.boxDecoration, this.width);

  Widget button() {
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
          child: Center(child: content),
        ),
      ),
    );
  }
}

class ActionButtonsStyle extends StatefulWidget {
  final customFunction;
  final Color color;
  final String text;
  final IconData icon;
  ActionButtonsStyle(
      {@required this.color,
      @required this.text,
      this.customFunction,
      this.icon});
  @override
  _ActionsButtonsStyleState createState() => _ActionsButtonsStyleState();
}

class _ActionsButtonsStyleState extends State<ActionButtonsStyle> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => {
        showDialog(
            context: context,
            builder: (context) {
              return widget.customFunction();
            }).then((value) => Container())
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            widget.icon,
            size: 14,
          ),
          Text(
            widget.text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
      color: widget.color,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
      ),
      textColor: Colors.white,
      padding: EdgeInsets.all(12.0),
      splashColor: widget.color,
    );
  }
}
