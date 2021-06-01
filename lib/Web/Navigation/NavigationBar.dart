import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/authentication_service.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/Style/NavigationStyle.dart';
import 'package:provider/provider.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar>
{
  NavigationEnum currentPage = NavigationEnum.HANDLE_PROJECTS;
  final navLinks = ["Handle Projects", "Handle Users", "Profile"];

  List<Widget> navItem ()
  {
    return navLinks.map((text) {
    }).toList();
  }

  void _goHome() {
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        children: <Widget>[
          navbarRowItems(),
          Text(ResponsiveLayout.isSmallScreen(context).toString())
,          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:<Widget> [
                  ...navItem(),
                ]
            )
          else hamburgerIcon
        ],
      ),
    );
  }
}
