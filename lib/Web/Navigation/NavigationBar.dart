import 'package:flutter/material.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Web/Login.dart';
import 'package:responsive_layout_builder/responsive_layout_builder.dart';
import '../WebConstants/responsiveLayout.dart';
import 'package:flutter2/Web/Navigation/NavigationPages.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';

class NavigationBar extends StatefulWidget {
  final customFunction;
  NavigationBar({this.customFunction});
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar>
{
  void func(text)
  {
    if (text == "Handle Projects"){
      currentPage = Navigation.HANDLE_PROJECTS;
    } else if (text == "Handle Users") {
      currentPage = Navigation.HANDLE_USERS;
    } else {
      currentPage = Navigation.PROFILE;
    }
    widget.customFunction(currentPage);
  }
  Navigation currentPage = Navigation.HANDLE_PROJECTS;
  final navLinks = ["Handle Projects", "Handle Users", "Profile"];
  String te = "";
  List<Widget> navItem ()
  {
    return navLinks.map((text) {
      return NavigationsButtonsStyle(
              () => func(text),
          Text(text, style: TextStyle(fontFamily: "Montserrat-Italic",
              backgroundColor: Colors.transparent)),
          navigationButtons, 120).button();
    }).toList();
  }
  final PageRouteBuilder _homeRoute = new PageRouteBuilder(
    pageBuilder: (BuildContext context, _, __) {
      return LoginP();
    },
  );

  void _goHome() {
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45,  vertical: 38),
      child: Row(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
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
                ),
                child: Center(
                  child: Image.asset('images/icon.png'),
                ),

              ),
              SizedBox(
                width: 16,
              ),
              Text("FluTECH", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, fontFamily: "Butler"),)
            ],
          ),
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:<Widget> [
                  ...navItem(),
                ]..add(
                  NavigationsButtonsStyle(_goHome, Icon(
                    Icons.power_settings_new,
                    color: Colors.deepPurple,
                    size: 30.0,
                  ),
                    BoxDecoration(),
                    50
                  ).button(),
                )

            )
          else
            hamburgerIcon

        ],

      ),
    );
  }
}