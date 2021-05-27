import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/NavigationBar.dart';
import 'package:flutter2/Web/Navigation/NavigationPages.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';

class HomeAdmin extends StatefulWidget {
  final String email;
  HomeAdmin({@required this.email});
  @override
  _HomeAdminState createState() => _HomeAdminState(email: this.email);
}

class _HomeAdminState extends State<HomeAdmin> {
  Widget current;
  List<Widget> screens = [
  ];

  @override
  void initState() {
    super.initState();
    screens.add(    Column(
      children: <Widget>[
        Text("Handle Projects", style: TextStyle(fontSize: 30,fontFamily: 'Butler'),),
        Center(child: AllProjects(),),
      ],
    ),);
        screens.add(Column(
          children: <Widget>[
            Text("Handle Users", style: TextStyle(fontSize: 30,fontFamily: 'Butler'),),
            Center(child: AllStudents(),),
          ],
        ));
  }

  _HomeAdminState({@required this.email});
  final String email;
  NavigationEnum currentPage = NavigationEnum.HANDLE_PROJECTS;

    void navigationChange(nav)
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
              NavigationBar(),
              //screens[currentPage.index]
            ],
          ),
        ),
      ),
    );
  }
/*
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
              NavigationBar(customFunction: navigationChange),
              getCurrentPage(),
            ],
          ),
        ),
      ),
    );
  }
*/
}
