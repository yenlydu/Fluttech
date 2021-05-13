import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/signUpPage.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Web/Dashboard/dashboard.dart';
import 'package:flutter2/Model/Constants/C_Login.dart';
import 'package:flutter2/Web/Navigation/NavigationBar.dart';
import 'package:flutter2/Web/Navigation/NavigationPages.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';

class HomeAdmin extends StatefulWidget {
  HomeAdmin({@required this.email});
  String email = "";
  @override
  _HomeAdminState createState() => _HomeAdminState(email: this.email);
}

class _HomeAdminState extends State<HomeAdmin> {
  _HomeAdminState({@required this.email});
  final String email;
  Navigation currentPage = Navigation.HANDLE_PROJECTS;

  Widget getCurrentPage()
  {
    if (this.currentPage == Navigation.HANDLE_PROJECTS) {
      return Container(
        child: Column(
          children: <Widget>[
            Text("Handle Projects", style: TextStyle(fontSize: 30,fontFamily: 'Butler'),),
            Center(child: AllProjects(),),
          ],
        ),
      );
    } else if (this.currentPage == Navigation.HANDLE_USERS) {
      return Container(
        child: Column(
          children: <Widget>[
            Text("Handle Users", style: TextStyle(fontSize: 30,fontFamily: 'Butler'),),

            AllStudents(),

          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            Text(
              "Profile", style: TextStyle(fontSize: 30, fontFamily: 'Butler'),),
            Profile(),
          ],
        ),
      );
    }

    }

    void parentChange(nav)
    {
      setState(() {
        currentPage = nav;
      });

    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavigationBar(customFunction: parentChange),
              getCurrentPage(),
            ],
          ),
        ),
      ),
    );
  }
}
