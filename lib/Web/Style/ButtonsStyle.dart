import 'package:flutter/material.dart';
import 'package:flutter2/Web/Style/ActionsButtons.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';

class NavigationButtonsStyle {
  Widget content;
  BoxDecoration boxDecoration;
  double width;
  final tap;

  NavigationButtonsStyle(this.tap ,this.content, this.boxDecoration, this.width);

  Widget button() {
    return InkWell(
      onTap: ()=>{
        print("etered ontap"),
        tap()
      },
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

Widget logOut(_goHome)
{
  return NavigationButtonsStyle(_goHome,Icon(
    Icons.power_settings_new,
    color: Colors.deepPurple,
    size: 30.0,
  ),
      BoxDecoration(),
      50
  ).button();
}

class ActionButtonsStyle extends StatefulWidget
{
  final customFunction;
  final Color color;
  final String text;
  final IconData icon;
  final TextStyle textStyle;

    ActionButtonsStyle({@required this.color, @required this.text, this.customFunction, this.icon, this.textStyle});
  @override
  _ActionsButtonsStyleState createState() => _ActionsButtonsStyleState();
}

class _ActionsButtonsStyleState extends State<ActionButtonsStyle> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: ()=>{
      showDialog(
        context: context,
        builder: (context) {
          return widget.customFunction();
        }
      ).then((value) => Container())
      },
        child: Container(
          width: 100,
          height: !ResponsiveLayout.isSmallScreen(context) ? 30 : 50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(child:           actionsButton(context, widget.textStyle, widget.icon, widget.text)
              )
            ],
          ),
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
